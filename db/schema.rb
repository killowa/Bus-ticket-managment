# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_06_084100) do

  create_table "buses", force: :cascade do |t|
    t.integer "capacity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "trip_id"
    t.index ["trip_id"], name: "index_buses_on_trip_id"
  end

  create_table "buses_trips", force: :cascade do |t|
    t.integer "bus_id"
    t.integer "trip_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bus_id"], name: "index_buses_trips_on_bus_id"
    t.index ["trip_id"], name: "index_buses_trips_on_trip_id"
  end

  create_table "buses_trips_tables", id: false, force: :cascade do |t|
    t.integer "bus_id"
    t.integer "trip_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bus_id"], name: "index_buses_trips_tables_on_bus_id"
    t.index ["trip_id"], name: "index_buses_trips_tables_on_trip_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "trip_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "department"
    t.index ["trip_id"], name: "index_students_on_trip_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "student_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "price"
    t.integer "trip_id", null: false
    t.index ["student_id"], name: "index_tickets_on_student_id"
    t.index ["trip_id"], name: "index_tickets_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "source"
    t.string "destination"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "starting_time"
    t.integer "ending_time"
    t.float "price"
    t.integer "available_places"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "type"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buses", "trips"
  add_foreign_key "students", "trips"
  add_foreign_key "tickets", "students"
  add_foreign_key "tickets", "trips"
end
