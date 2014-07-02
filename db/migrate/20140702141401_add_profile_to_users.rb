class AddProfileToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :name, :string
  	add_column :users, :about, :text
  	add_column :users, :landlord, :boolean
  	add_column :users, :age, :integer
  end
end

