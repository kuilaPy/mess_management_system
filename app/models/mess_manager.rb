class MessManager < ApplicationRecord
  belongs_to :student, class_name: "student", foreign_key: "student_id"
  has_many :transactions, class_name: "transaction", foreign_key: "reference_id"
  has_many :guest_meals, class_name: "guest_meal", foreign_key: "reference_id"
end
