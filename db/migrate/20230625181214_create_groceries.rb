class CreateGroceries < ActiveRecord::Migration[7.0]
  def change
    create_table :groceries do |t|
      t.date :date
      t.string :total_expenses 
      t.belongs_to :mess_manager, foreign_key: true     

      t.timestamps
    end
  end
end
