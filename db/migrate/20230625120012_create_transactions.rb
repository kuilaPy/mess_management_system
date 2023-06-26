class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :student, foreign_key: true
      t.belongs_to :mess_manager, foreign_key: true
      # t.belongs_to :fund_manager, foreign_key: true
      t.string :amount
      t.string :comment
      t.integer :txn_type
      t.integer :wallet_type
      t.date :date
      t.timestamps
    end
  end
end
