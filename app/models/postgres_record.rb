class PostgresRecord < ActiveRecord::Base
  self.abstract_class = true
  establish_connection :"postgres_#{Rails.env}"
end
