class AddAasmStateToTxn < ActiveRecord::Migration[7.0]
  def change
    add_column :txns, :aasm_state, :string
    add_column :txns, :is_bill_required, :boolean ,defaut: false
  end
end
