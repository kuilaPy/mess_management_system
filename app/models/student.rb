class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :validatable
  
  has_many :mess_managers
  has_many :txns
  has_one :general_secretary 
  has_one :assistant_general_secretary
  has_one :fund_manager  
  
  ROLE = {1=> "mess_manager", 2=> "fund_manager", 3=> "G.S",4=> "A.G.S", 5=> "super_admin"}
end
