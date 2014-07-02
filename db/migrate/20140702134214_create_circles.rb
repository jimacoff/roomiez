class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
    	t.string :city
    	t.string :state
    	t.integer :zipcode
    end
  end
end
