class Marketing < ApplicationRecord
  # belongs_to :mess_manager, class_name: "mess_manager", foreign_key: "mess_manager_id"
  belongs_to :txn
end
