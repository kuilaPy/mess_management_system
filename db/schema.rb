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

ActiveRecord::Schema[7.0].define(version: 2023_08_06_172309) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assistant_general_secretaries", force: :cascade do |t|
    t.date "which_year"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_assistant_general_secretaries_on_student_id"
  end

  create_table "fund_managers", force: :cascade do |t|
    t.date "which_financial_year"
    t.decimal "opening_balanc", precision: 10, scale: 2
    t.decimal "closing_balance", precision: 10, scale: 2
    t.decimal "total_current_balance", precision: 10, scale: 2
    t.bigint "student_id"
    t.boolean "is_active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_fund_managers_on_student_id"
  end

  create_table "general_secretaries", force: :cascade do |t|
    t.date "which_year"
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_general_secretaries_on_student_id"
  end

  create_table "groceries", force: :cascade do |t|
    t.date "date"
    t.decimal "total_expenses", precision: 10, scale: 2
    t.bigint "mess_manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mess_manager_id"], name: "index_groceries_on_mess_manager_id"
  end

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

  create_table "marketings", force: :cascade do |t|
    t.date "date"
    t.decimal "total_expenses", precision: 10, scale: 2
    t.decimal "vegitable", precision: 10, scale: 2
    t.decimal "chicken", precision: 10, scale: 2
    t.decimal "egg", precision: 10, scale: 2
    t.decimal "pogg", precision: 10, scale: 2
    t.bigint "mess_manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mess_manager_id"], name: "index_marketings_on_mess_manager_id"
  end

  create_table "mess_managers", force: :cascade do |t|
    t.bigint "student_id"
    t.date "for_which_month"
    t.string "assign_by"
    t.boolean "is_active"
    t.decimal "total_marketing_expenses", precision: 10, scale: 2
    t.decimal "total_grocery_expenses", precision: 10, scale: 2
    t.decimal "total_miscellaneous_expenses", precision: 10, scale: 2
    t.decimal "total_collection_of_guest_meal", precision: 10, scale: 2
    t.decimal "grant_total_of_expenses", precision: 10, scale: 2
    t.decimal "per_head_expenses", precision: 10, scale: 2
    t.decimal "wallet_balance", precision: 10, scale: 2
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
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "last_sign_in_at"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role_id"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

  create_table "txns", force: :cascade do |t|
    t.bigint "student_id"
    t.bigint "mess_manager_id"
    t.decimal "amount", precision: 10, scale: 2
    t.string "comment"
    t.integer "txn_type"
    t.integer "wallet_type"
    t.date "date"
    t.decimal "net_amount", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fund_manager_id"
    t.index ["mess_manager_id"], name: "index_txns_on_mess_manager_id"
    t.index ["student_id"], name: "index_txns_on_student_id"
  end

  add_foreign_key "assistant_general_secretaries", "students"
  add_foreign_key "fund_managers", "students"
  add_foreign_key "general_secretaries", "students"
  add_foreign_key "groceries", "mess_managers"
  add_foreign_key "guest_meals", "mess_managers"
  add_foreign_key "marketings", "mess_managers"
  add_foreign_key "mess_managers", "students"
  add_foreign_key "txns", "mess_managers"
  add_foreign_key "txns", "students"
end
