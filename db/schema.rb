# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_10_12_134042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "graduates", force: :cascade do |t|
    t.string "name"
    t.string "speciality"
    t.string "school_name"
    t.integer "school_department"
    t.date "graduation_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "worker_id", null: false
    t.index ["worker_id"], name: "index_graduates_on_worker_id"
  end

  create_table "positions", force: :cascade do |t|
    t.string "position_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "worker_id", null: false
    t.bigint "company_id", null: false
    t.bigint "site_id", null: false
    t.index ["company_id"], name: "index_positions_on_company_id"
    t.index ["site_id"], name: "index_positions_on_site_id"
    t.index ["worker_id"], name: "index_positions_on_worker_id"
  end

  create_table "sites", force: :cascade do |t|
    t.text "name"
    t.string "site_type"
    t.date "start_date"
    t.date "end_date"
    t.float "amount"
    t.string "money_unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "client_id", null: false
    t.index ["client_id"], name: "index_sites_on_client_id"
  end

  create_table "trainings", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "training_type"
    t.bigint "worker_id", null: false
    t.index ["worker_id"], name: "index_trainings_on_worker_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "birth_date"
    t.date "hire_date"
    t.integer "matricule"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "graduates", "workers"
  add_foreign_key "positions", "companies"
  add_foreign_key "positions", "sites"
  add_foreign_key "positions", "workers"
  add_foreign_key "sites", "clients"
  add_foreign_key "trainings", "workers"
end
