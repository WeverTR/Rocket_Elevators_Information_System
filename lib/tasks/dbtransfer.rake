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
        Rake::Task["db:migrate:reset"].invoke
        puts "Seeding data..."
        Rake::Task["db:seed"].invoke
        puts "Seeding complete."
    end

    task :connections => :environment do
        mysql = ActiveRecord::Base.establish_connection("#{Rails.env}".to_sym).connection
        puts "Connection with MySql database established."
        quote = Quote.select(:) 
    end


end