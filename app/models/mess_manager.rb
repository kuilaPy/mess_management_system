class MessManager < ApplicationRecord
  belongs_to :student
  has_many :transactions
  has_many :guest_meals



  scope :active, -> {find_by_is_active( true)}
end
