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

ActiveRecord::Schema.define(version: 2020_07_03_025443) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exact_availabilities", force: :cascade do |t|
    t.text "doctor_id"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recurring_availabilities", force: :cascade do |t|
    t.text "doctor_id"
    t.integer "weekday"
    t.time "start_time"
    t.time "end_time"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "recurring_availability_id", null: false
    t.text "doctor_id"
    t.text "patient_id"
    t.datetime "start_datetime"
    t.datetime "end_datetime"
    t.datetime "confirmation_at"
    t.datetime "confirmation_deadline"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["recurring_availability_id"], name: "index_schedules_on_recurring_availability_id"
  end

  add_foreign_key "schedules", "recurring_availabilities"
end
