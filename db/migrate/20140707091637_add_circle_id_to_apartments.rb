class AddCircleIdToApartments < ActiveRecord::Migration
  def change
    add_column :apartments, :circle_id, :integer
  end
end
