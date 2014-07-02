class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
    	t.string :name
    	t.string :street_address
    	t.boolean :occupied 
    	t.string :country
    	t.integer :zipcode
    	t.integer :user_id
    end
  end
end
