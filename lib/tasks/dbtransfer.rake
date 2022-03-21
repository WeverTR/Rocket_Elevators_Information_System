namespace :dwh do

    task :psqlreset do
        sh "DB=postgres rake db:migrate:reset"
    end
   
    task :migrate do
        Rake::Task["db:migrate:reset"].invoke
        Rake::Task["dwh:psqlreset"].invoke
        puts "All databases have been reset and migrated successfully."
    end

    task :seed do
        puts "Resetting environments..."
        Rake::Task["dwh:migrate"].invoke
        puts "Seeding data..."
        Rake::Task["db:seed"].invoke
        puts "Seeding complete."
    end

    task :factquote => :environment do
        conn = PG::Connection.new(port:'5432', dbname:'wevertr', user:'wevertr', password:'3090')
        Rake::Task["dwh:truncate"].invoke
        quotes = Quote.select(:id, :created_at, :companyname, :email, :elevatorNum)
        quotes.each do |quote|
            puts quote.id
            puts quote.created_at
            puts quote.companyname
            puts quote.email
            puts quote.elevatorNum
            query = "INSERT INTO fact_quotes(quote_id, creation, company_name, email, nb_elevator) values('#{quote.id}', '#{quote.created_at}', '#{quote.companyname}', '#{quote.email}', '#{quote.elevatorNum}')"
            conn.exec(query)
        end
        puts "Query complete."
    end

    task :factcontact => :environment do
        conn = PG::Connection.new(port:'5432', dbname:'wevertr', user:'wevertr', password:'3090')
        Rake::Task["dwh:truncate"].invoke
        leads = Leads.select(:id, :created_at, :companyname, :email, :projectname)
        leads.each do |lead|
            puts lead.id
            puts lead.created_at
            puts lead.companyname
            puts lead.email
            puts lead.projectname
            query = "INSERT INTO fact_contacts(contact_id, creation_date, company_name, email, project_name) values('#{lead.id}', '#{lead.created_at}', '#{lead.companyname}', '#{lead.email}', '#{lead.projectname}')"
            conn.exec(query)
        end
        puts "Query complete."
    end

    task :factelevator => :environment do
        conn = PG::Connection.new(port:'5432', dbname:'wevertr', user:'wevertr', password:'3090')
        Rake::Task["dwh:truncate"].invoke
        elevators = Elevator.select(:serial_number, :date_of_commissioning, :column_id)
        elevators.each do |elevator|
            puts elevator.column.battery.building.address.city
            puts elevator.serial_number
            puts elevator.date_of_commissioning
            puts elevator.column.battery.building_id
            puts elevator.column.battery.building.customer_id
            query = "INSERT INTO fact_elevators(serial_number, date_of_commissioning, building_id, customer_id, building_city) values('#{elevator.serial_number}', '#{elevator.date_of_commissioning}', '#{elevator.column.battery.building_id}', '#{elevator.column.battery.building.customer_id}', '#{elevator.column.battery.building.address.city}')"
            conn.exec(query)
            end
            puts "Query complete."
    end

    task :dim => :environment do
        conn = PG::Connection.new(port:'5432', dbname:'wevertr', user:'wevertr', password:'3090')
        Rake::Task["dwh:truncate"].invoke
        customers = Customer.select(:id, :created_at, :company_name, :full_name_company_contact, :email_company, :address_id)
        elevators = Elevator.select(:id, :column_id)
        elevatorIdList = []

        elevators.all.each do |elevator|
            elevatorIdList << elevator.column.battery.building.customer_id
        end

        elevatorIdList = elevatorIdList.tally.values

        customers.each do |customer|
            puts customer.created_at
            puts customer.company_name
            puts customer.full_name_company_contact
            puts customer.email_company
            puts customer.address.city
            puts elevatorIdList[customer.id - 1]
            query = "INSERT INTO dim_customers(creation_date, company_name, full_name_of_company_contact, email_of_company_contact, nb_elevators, customer_city) values('#{customer.created_at}', '#{customer.company_name}', '#{customer.full_name_company_contact}', '#{customer.email_company}',
            '#{elevatorIdList[customer.id - 1]}', '#{customer.address.city}')"
            conn.exec(query)
        end
        puts "Query complete."
    end

    task :query1 => :environment do
        conn = PG::Connection.new(port:'5432', dbname:'wevertr', user:'wevertr', password:'3090')
        Rake::Task["dwh:factcontact"].invoke
        puts "Beginning query: sorting number of unique requests by month..."

        query = FactContact.select(:creation_date).count
        puts query/12.to_f
        puts "Query complete."
    end

    task :query2 => :environment do
        conn = PG::Connection.new(port:'5432', dbname:'wevertr', user:'wevertr', password:'3090')
        Rake::Task["dwh:factquote"].invoke
        puts "Beginning query: sorting number of unique requests by month..."

        query = FactQuote.select(:creation).count
        puts query/12.to_f
        puts "Query complete."
    end

    task :query3 => :environment do
        conn = PG::Connection.new(port:'5432', dbname:'wevertr', user:'wevertr', password:'3090')
        Rake::Task["dwh:dim"].invoke
        puts "Sorting number of elevators contained in buildings owned by each customer. First number is customer ID, second is number of
        elevators. Beginning query..."

        query = DimCustomer.order(:id).group(:id, :nb_elevators).count
        puts query
        puts "Query complete."
    end

    task :checkTrunc do
        STDOUT.puts "Truncating databases. Which database? 1 for MySql, 2 for PostgreSql, 3 for both, any other key to cancel: (1/2/3)"
        input = STDIN.gets.strip
        if input == '1'
            Rake::Task["dwh:truncateMysql"].reenable
            Rake::Task["dwh:truncateMysql"].invoke
        elsif input == '2'
            Rake::Task["dwh:truncatePsql"].reenable
            Rake::Task["dwh:truncatePsql"].invoke
        elsif input == '3'
            Rake::Task["dwh:truncateAll"].reenable
            Rake::Task["dwh:truncateAll"].invoke
        else 
            p "Cancelling truncation."
            break
        end
      end

    task :checkSeed do
        STDOUT.puts "Truncate Mysql database or migrate reset? 1 for truncation, 2 for reset, 3 to skip, any other key to cancel: (1/2/3)"
        if input == '1'
            Rake::Task["dwh:truncateMysql"].reenable
            Rake::Task["dwh:truncateMysql"].invoke
        elsif input == '2'
            Rake::Task["db:migrate:reset"].reenable
            Rake::Task["db:migrate:reset"].invoke
        elsif input == '3'
            Rake::Task["db:seed"].reenable
            Rake::Task["db:seed"].invoke
        else
            p "Cancelling seed."
            break
        end
    end

    task :truncatePsql => :environment do
        puts "Clearing PostgreSql data warehouse..."
        cleaner = DatabaseCleaner[:active_record, db: PostgresRecord]
        cleaner.clean_with(:truncation)
        puts "PostgreSql data warehouse cleared."
    end

    task :truncateMysql => :environment do
        puts "Clearing Mysql database..."
        DatabaseCleaner.clean_with(:truncation)
        puts "Mysql database cleared."
    end

    task :truncateAll => :environment do
        puts "Clearing all databases..."
        mysqlCleaner = DatabaseCleaner[:active_record]
        mysqlCleaner.clean_with(:truncation)
        psqlCleaner = DatabaseCleaner[:active_record, db: PostgresRecord]
        psqlCleaner.clean_with(:truncation)
        puts "all databases cleared."
    end

    task :truncate => :environment do
        Rake::Task["dwh:checkTrunc"].invoke
    end

end