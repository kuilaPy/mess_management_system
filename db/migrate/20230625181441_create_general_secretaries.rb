class CreateGeneralSecretaries < ActiveRecord::Migration[7.0]
  def change
    create_table :general_secretaries do |t|

      t.timestamps
    end
  end
end
