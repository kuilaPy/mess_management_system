class CreateMarketings < ActiveRecord::Migration[7.0]
  def change
    create_table :marketings do |t|
      t.date :date
      t.decimal :total_expenses  , precision: 10, scale: 2 
      t.decimal :vegitable , precision: 10, scale: 2 
      t.decimal :chicken , precision: 10, scale: 2 
      t.decimal :egg , precision: 10, scale: 2 
      t.decimal :pogg , precision: 10, scale: 2 
      t.belongs_to :mess_manager, foreign_key: true 

      t.timestamps
    end
  end
end
