class CreateAssistantGeneralSecretaries < ActiveRecord::Migration[7.0]
  def change
    create_table :assistant_general_secretaries do |t|
      t.date :which_year
      t.belongs_to :student, foreign_key: true
      t.timestamps
    end
  end
end
