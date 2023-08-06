class CreateFundManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :fund_managers do |t|
      t.date :which_financial_year
      t.decimal :opening_balanc , precision: 10, scale: 2 
      t.decimal :closing_balance , precision: 10, scale: 2 
      t.decimal :total_current_balance , precision: 10, scale: 2 
      t.belongs_to :student, foreign_key: true
      t.boolean :is_active
      
      t.timestamps
    end
  end
end
