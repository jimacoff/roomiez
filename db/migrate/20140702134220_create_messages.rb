class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.text :body
    	t.integer :sender_id
    	t.integer :receiver_id
    	t.boolean :received
    	t.timestamp
    end
  end
end
