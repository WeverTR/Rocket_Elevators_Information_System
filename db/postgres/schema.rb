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

ActiveRecord::Schema.define(version: 2022_03_17_152833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dim_customers", force: :cascade do |t|
    t.string "creation_date"
    t.string "company_name"
    t.string "full_name_of_company_contact"
    t.string "email_of_company_contact"
    t.integer "nb_elevators"
    t.string "customer_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fact_contacts", force: :cascade do |t|
    t.integer "contact_id"
    t.string "creation_date"
    t.string "company_name"
    t.string "email"
    t.string "project_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dim_customer_id"
    t.index ["dim_customer_id"], name: "index_fact_contacts_on_dim_customer_id"
  end

  create_table "fact_elevators", force: :cascade do |t|
    t.integer "serial_number"
    t.string "date_of_commissioning"
    t.integer "building_id"
    t.integer "customer_id"
    t.string "building_city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dim_customer_id"
    t.index ["dim_customer_id"], name: "index_fact_elevators_on_dim_customer_id"
  end

  create_table "fact_quotes", force: :cascade do |t|
    t.integer "quote_id"
    t.string "creation"
    t.string "company_name"
    t.string "email"
    t.string "nb_elevator"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "dim_customer_id"
    t.index ["dim_customer_id"], name: "index_fact_quotes_on_dim_customer_id"
  end

  add_foreign_key "fact_contacts", "dim_customers"
  add_foreign_key "fact_elevators", "dim_customers"
  add_foreign_key "fact_quotes", "dim_customers"
end
