class CreateFundManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :fund_managers do |t|
      t.string :which_financial_year
      t.string :opening_balanc
      t.string :closing_balance
      t.string :total_current_balance
      t.belongs_to :student, foreign_key: true
      t.timestamps
    end
  end
end
