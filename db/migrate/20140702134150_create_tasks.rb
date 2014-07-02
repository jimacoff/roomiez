class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
    	t.integer :apartment_id
    	t.string :title
    	t.text :description
    	t.boolean :completed
    end
  end
end
