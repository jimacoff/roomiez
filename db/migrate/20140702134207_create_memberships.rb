class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
    	t.string :user_id
    	t.integer :circle_id
    	t.boolean :received
    	t.boolean :approved
    	t.timestamp
    end
  end
end
