class FundManager < ApplicationRecord
  belongs_to :student
  has_many :txns

  # scope :active, -> {find_by_is_active( true)}
end
