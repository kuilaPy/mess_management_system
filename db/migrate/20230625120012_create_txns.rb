class CreateTxns < ActiveRecord::Migration[7.0]
  def change
    create_table :txns do |t|
      t.belongs_to :student, foreign_key: true
      t.belongs_to :mess_manager, foreign_key: true
      # t.belongs_to :fund_manager, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2
      t.string :comment
      t.integer :txn_type
      t.integer :wallet_type
      t.date :date
      t.decimal :net_amount, precision: 10, scale: 2
      t.timestamps
    end
  end
end
