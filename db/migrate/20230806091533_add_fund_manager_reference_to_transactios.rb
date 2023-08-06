class AddFundManagerReferenceToTransactios < ActiveRecord::Migration[7.0]
  def change
    add_column :transactions, :fund_manager_id, :string
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
