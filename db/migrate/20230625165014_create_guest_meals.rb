class CreateGuestMeals < ActiveRecord::Migration[7.0]
  def change
    create_table :guest_meals do |t|
      t.string :for_whom
      t.integer :meal_count_in_a_day
      t.string :status
      t.belongs_to :mess_manager, foreign_key: true
      t.date :date
      

      t.timestamps
    end
  end
end
