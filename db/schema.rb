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

ActiveRecord::Schema[7.0].define(version: 2023_06_25_165014) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "guest_meals", force: :cascade do |t|
    t.string "for_whom"
    t.integer "meal_count_in_a_day"
    t.string "status"
    t.bigint "mess_manager_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mess_manager_id"], name: "index_guest_meals_on_mess_manager_id"
  end

  create_table "mess_managers", force: :cascade do |t|
    t.bigint "student_id"
    t.text "for_which_month"
    t.string "assign_by"
    t.boolean "is_active"
    t.string "total_marketing_expenses"
    t.string "total_grocery_expenses"
    t.string "total_miscellaneous_expenses"
    t.string "total_collection_of_guest_meal"
    t.string "grant_total_of_expenses"
    t.string "per_head_expenses"
    t.string "wallet_balance"
    t.integer "mess_manager_type"
    t.text "remarks"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_mess_managers_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.date "date_of_birth"
    t.bigint "phone_no", null: false
    t.text "address"
    t.integer "department", null: false
    t.date "admission_year"
    t.date "passout_year"
    t.text "job_which_company"
    t.boolean "is_current_borders", null: false
    t.boolean "is_admin", default: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "last_sign_in_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "mess_manager_id"
    t.string "amount"
    t.string "comment"
    t.integer "txn_type"
    t.integer "wallet_type"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mess_manager_id"], name: "index_transactions_on_mess_manager_id"
    t.index ["student_id"], name: "index_transactions_on_student_id"
  end

  add_foreign_key "guest_meals", "mess_managers"
  add_foreign_key "mess_managers", "students"
  add_foreign_key "transactions", "mess_managers"
  add_foreign_key "transactions", "students"
end
