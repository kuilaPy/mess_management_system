class CreateMessManagers < ActiveRecord::Migration[7.0]
  def change
    create_table :mess_managers do |t|
      t.belongs_to :student, foreign_key: true
      t.text   :for_which_month
      t.string :assign_by
      t.boolean :is_active
      t.string :total_marketing_expenses
      t.string :total_grocery_expenses
      t.string :total_miscellaneous_expenses
      t.string :total_collection_of_guest_meal
      t.string :grant_total_of_expenses
      t.string :per_head_expenses
      t.string :wallet_balance
      t.integer :mess_manager_type
      t.text :remarks
      t.timestamps  null:false
    end
  end
end
