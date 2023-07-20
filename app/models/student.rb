class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  
  has_many :mess_managers, class_name: "mess_manager", foreign_key: "reference_id"
  has_many :transactions, class_name: "transaction", foreign_key: "reference_id"  
  has_one :general_secretary 
  has_one :assistant_general_secretary
  has_one :fund_manager    
end
