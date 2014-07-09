class AddCircleIdAndRentDetailsToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :rent, :integer
    add_column :apartments, :state, :string
    add_column :apartments, :bedrooms, :integer
    add_column :apartments, :bathrooms, :float
    add_column :apartments, :furnished, :boolean
    add_column :apartments, :pets, :boolean
    add_column :apartments, :smoking, :boolean
  end
end
