class CreateAssistantGeneralSecretaries < ActiveRecord::Migration[7.0]
  def change
    create_table :assistant_general_secretaries do |t|

      t.timestamps
    end
  end
end
