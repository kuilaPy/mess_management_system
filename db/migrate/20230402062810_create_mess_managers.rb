class CreateMessManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :mess_managers do |t|
      t.belongs_to :student, foreign_key: true
      t.date :for_which_month
      t.string :assign_by
      t.boolean :is_active
      t.decimal :total_marketing_expenses, precision: 10, scale: 2
      t.decimal :total_grocery_expenses, precision: 10, scale: 2
      t.decimal :total_miscellaneous_expenses, precision: 10, scale: 2
      t.decimal :total_collection_of_guest_meal, precision: 10, scale: 2
      t.decimal :grant_total_of_expenses, precision: 10, scale: 2
      t.decimal :per_head_expenses, precision: 10, scale: 2
      t.decimal :wallet_balance, precision: 10, scale: 2
      t.integer :mess_manager_type
      t.text :remarks
      t.timestamps  null:false
    end
  end
end
