# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_03_20_204204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dim_customers", force: :cascade do |t|
    t.string "creation_date"
    t.string "company_name"
    t.string "full_name_of_company_contact"
    t.string "email_of_company_contact"
    t.integer "nb_elevators"
    t.string "customer_city"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.bigint "fact_quotes_id"
    t.bigint "fact_contacts_id"
    t.bigint "fact_elevators_id"
    t.index ["fact_contacts_id"], name: "index_dim_customers_on_fact_contacts_id"
    t.index ["fact_elevators_id"], name: "index_dim_customers_on_fact_elevators_id"
    t.index ["fact_quotes_id"], name: "index_dim_customers_on_fact_quotes_id"
  end

  create_table "fact_contacts", force: :cascade do |t|
    t.integer "contact_id"
    t.string "creation_date"
    t.string "company_name"
    t.string "email"
    t.string "project_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fact_elevators", force: :cascade do |t|
    t.integer "serial_number"
    t.string "date_of_commissioning"
    t.integer "building_id"
    t.integer "customer_id"
    t.string "building_city"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fact_quotes", force: :cascade do |t|
    t.integer "quote_id"
    t.string "creation"
    t.string "company_name"
    t.string "email"
    t.string "nb_elevator"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "dim_customers", "fact_contacts", column: "fact_contacts_id"
  add_foreign_key "dim_customers", "fact_elevators", column: "fact_elevators_id"
  add_foreign_key "dim_customers", "fact_quotes", column: "fact_quotes_id"
end
