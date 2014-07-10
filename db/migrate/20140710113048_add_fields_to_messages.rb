class AddFieldsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :subject, :string
    add_column :messages, :sender, :string
    add_column :messages, :recepient, :string
    add_column :messages, :read, :integer
  end
end
