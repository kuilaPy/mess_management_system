# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Student.create(email: "avijit@admin.in", password: 12345678, name:"Avijit kuila",phone_no:9609235365,role_id: 5,department: 1,is_current_borders: true)
Student.create(email: "test@admin.in", password: 12345678, name:"test student",phone_no:700133738,department: 1,is_current_borders: true)
Student.create(email: "mess@admin.in", password: 12345678, name:"mess manager",phone_no:7000122211,role_id: 1,department: 1,is_current_borders: true)
Student.create(email: "fund@admin.in", password: 12345678, name:"fund manager",phone_no:7010122211,role_id: 2,department: 1,is_current_borders: true)

MessManager.create(student_id: 3 , is_active: true, wallet_balance: 0.00)
FundManager.create( total_current_balance: 0.00, student_id:4, is_active: true)

