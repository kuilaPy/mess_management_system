class Transaction < ApplicationRecord
  belongs_to :mess_manager, class_name: "mess_manager", foreign_key: "mess_managebeloject_id", optional: true
  belongs_to :fund_manager, class_name: "fund_manager", foreign_key: "fund_manager_id", optional: true
  belongs_to :student, class_name: "student", foreign_key: "student_id"
  has_one :grocery
  has_one :marketing
 

  TXN_TYPE = {1=> "Mess Wallet Credit +C.M.W", 2=> "Per Head Payment +C.M.W", 3=> "Per Head Return -D.M.W", 4=> "Daily Marketing Payment -D.M.W" , 5=> "Daily Marketing Return +C.M.W", 6=> "Miscellaneous Payment -D.M.W" ,7=> "Miscellaneous Return +C.M.W", 8=> "Guest Meal Payment +C.M.W", 9=> "Fund Wallet Credit +C.F.W", 10=> "Fund wallet Debit -D.F.W"}
  WALLET_TYPE = {1=> "Mess Wallet", 2=> "Fund Wallet"}
end
