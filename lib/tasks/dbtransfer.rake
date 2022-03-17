namespace :dwh do
   
    task :migrate do
        Rake::Task["db:migrate:reset"].invoke
        sh "DB=postgres rake db:migrate:reset"
        puts "All databases have been reset and migrated successfully."
    end

    task :seed do
        puts "Resetting environments..."
        Rake::Task["db:migrate:reset"].invoke
        sh "DB=postgres rake db:migrate:reset"
        puts "Seeding data..."
        Rake::Task["db:seed"].invoke
        puts "Seeding complete."
    end

    task :import do |t, args|

        puts "Cleaning database..."
        cleaner = DatabaseCleaner[:active_record, {model: PostgresRecord}]
        cleaner.strategy = :truncation
        cleaner.clean
        host = 
        puts "Database Cleaned."

        ActiveRecord::Base.establish_connection(:weverMysql)
        puts "Established connection with #{environment} environment. #{database} successfully loaded."
        sh "mysqldump -uroot -p #{database} --skip-triggers --compact " + "--ignore-table=#{database}.schema_migrations " + "--no-create-info > #{RAILS_ROOT}/db/data/#{filename}"

        ActiveRecord::Base.establish_connection(:wevertr)
        puts "Established connection with #{environment} environment. #{database} successfully loaded."
        puts "Importing data from #{} #{filename}..."
        sh "psql -h localhost -d wevertr -U wevertr -p 3090 -f #{RAILS_ROOT}/db/data/#{filename}"
        puts "Completed loading #{filename} into #{environment} environment."
        puts "Import successful!"
    end
end