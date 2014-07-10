class RemoveFieldsFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :sender_id, :integer
    remove_column :messages, :receiver_id, :integer
    remove_column :messages, :received, :boolean
  end
end
