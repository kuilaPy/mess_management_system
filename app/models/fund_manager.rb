class FundManager < ApplicationRecord
  belongs_to :student
  has_many :transactionss

  # scope :active, -> {find_by_is_active( true)}
end
