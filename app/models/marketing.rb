class Marketing < ApplicationRecord
  # belongs_to :mess_manager, class_name: "mess_manager", foreign_key: "mess_manager_id"
  belongs_to :transaction, class_name: "transaction", foreign_key: "transaction_id"
end
