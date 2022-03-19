namespace :dwh do

    task :test do
        
    end

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
        conn = PG::Connection.new(host:'localhost', port:'5432', dbname:'wevertr', user:'wevertr', password:'3090')
        quotes = Quote.select(:id, :created_at, :companyname, :email, :elevatorNum)
        quotes.each do |quote|
            query = "INSERT INTO fact_quotes(quote_id, creation, company_name, email, nb_elevator) values('#{quote.id}', '#{quote.created_at}', '#{quote.companyname}', '#{quote.email}', '#{quote.elevatorNum}')"
            conn.exec(query)
        end
    end

    task :factcontact => :environment do
        conn = PG::Connection.new(host:'localhost', port:'5432', dbname:'wevertr', user:'wevertr', password:'3090')
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
    end

    task :factelevator => :environment do
        conn = PG::Connection.new(host:'localhost', port:'5432', dbname:'wevertr', user:'wevertr', password:'3090')
        elevators = Elevator.select(:serial_number, :date_of_commissioning, :building_id, :customer_id, :column_id)
        elevators.each do |elevator|
            puts elevator.column.battery.building.address.city
            puts elevator.serial_number
            puts elevator.date_of_commissioning
            puts elevator.building.id
            puts elevator.customer_id
            query = "INSERT INTO fact_elevators(serial_number, date_of_commissioning, building_id, customer_id, building_city) values('#{elevator.serial_number}', '#{elevator.date_of_commissioning}', '#{elevator.building_id}', '#{elevator.building.customer_id}', '#{elevator.column.battery.building.address.city}')"
            conn.exec(query)
            end
    end

    task :dim => :environment do
        conn = PG::Connection.new(host:'localhost', port:'5432', dbname:'wevertr', user:'wevertr', password:'3090')
        buildings = Building.select(:address_id, :customer_id)
        # address = Address.select(:quote_id)
        buildings.each do |building|
            puts building.customer.created_at
            puts building.customer.company_name
            puts building.customer.full_name_company_contact
            puts building.customer.email_company
            puts building.customer.quote.id
            puts building.address.city
            # query = "INSERT INTO dim_customers(creation_date, company_name, full_name_of_company_contact, email_of_company_contact, nb_elevators, customer_city) values('#{customer.created_at}', '#{customer.company_name}', '#{customer.full_name_company_contact}', '#{customer.email_company}',
            # '#{quote.elevatorNum}', '#{address.city}')"
            # conn.exec(query)
        end
    end

    task :import => :environment do

        puts "Importing data..."
        Rake::Task["dwh:dimcustomer"].invoke
        Rake::Task["dwh:factelevator"].invoke
        Rake::Task["dwh:factcontact"].invoke
        Rake::Task["dwh:factquote"].invoke
        puts "Data successfully imported."
    end  
end