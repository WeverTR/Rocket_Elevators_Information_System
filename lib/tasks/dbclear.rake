
namespace :clear do 

    task :all do
        ActiveRecord::Base.establish_connection(
            adapter: "mysql2",
            database: "mysql2",
            username: "root",
            password: "waelhermassi"
        )
        DatabaseCleaner.clean_with :truncation
        puts "cleandedTables"
      end
end     
