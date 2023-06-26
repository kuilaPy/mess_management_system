class CreateFundManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :fund_managers do |t|
    

      t.timestamps
    end
  end
end
