class Txn < ApplicationRecord
  belongs_to :mess_manager,optional: true
  belongs_to :fund_manager, optional: true
  belongs_to :student
  has_one :grocery
  has_one :marketing
 

  TXN_TYPE = {1=> "Mess Wallet Credit +C.M.W", 2=> "Per Head Payment +C.M.W", 3=> "Per Head Return -D.M.W", 4=> "Daily Marketing Payment -D.M.W" , 5=> "Daily Marketing Return +C.M.W", 6=> "Miscellaneous Payment -D.M.W" ,7=> "Miscellaneous Return +C.M.W", 8=> "Guest Meal Payment +C.M.W", 9=> "Fund Wallet Credit +C.F.W", 10=> "Fund wallet Debit -D.F.W"}
  WALLET_TYPE = {1=> "Mess Wallet", 2=> "Fund Wallet"}


  after_create :upadte_net_amount,:update_wallet


  def upadte_net_amount
    if self.mess_manager.present? 
      balance = self.mess_manager.wallet_balance.to_i
      if self.txn_type == 1 ||  self.txn_type == 2 ||  self.txn_type == 5 ||   self.txn_type == 7 ||  self.txn_type == 8
        balance = balance + self.amount.to_i 
      else
        balance = balance - self.amount.to_i
      end
      self.update(net_amount: balance)
    elsif self.fund_manager.present?
      balance = self.fund_manager.total_current_balance.to_i
      if self.txn_type == 9 
        balance = balance + self.amount.to_i 
      else
        balance = balance - self.amount.to_i
      end
      self.update(net_amount: balance)
    end
  end
  
  def update_wallet
    if self.mess_manager.present? 
      balance = self.mess_manager.wallet_balance.to_i
      if self.txn_type == 1 ||  self.txn_type == 2 ||  self.txn_type == 5 ||   self.txn_type == 7 ||  self.txn_type == 8
        balance = balance + self.amount.to_i 
      else
        balance = balance - self.amount.to_i
      end
      self.mess_manager.update(wallet_balance: balance)
    elsif self.fund_manager.present?
      balance = self.fund_manager.total_current_balance.to_i
      if self.txn_type == 9 
        balance = balance + self.amount.to_i 
      else
        balance = balance - self.amount.to_i
      end
      self.fund_manager.update(total_current_balance: balance)
    end
  end
  
end
