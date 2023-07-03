class FundManager < ApplicationRecord
  belongs_to :student, class_name: "student", foreign_key: "student_id"
  has_many :transactionss, class_name: "transactions", foreign_key: "reference_id"
end
