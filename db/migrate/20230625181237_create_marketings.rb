class CreateMarketings < ActiveRecord::Migration[7.0]
  def change
    create_table :marketings do |t|
      t.date :date
      t.string :total_expenses 
      t.string :vegitable
      t.string :chicken
      t.string :egg
      t.string :pogg
      t.belongs_to :mess_manager, foreign_key: true 

      t.timestamps
    end
  end
end
