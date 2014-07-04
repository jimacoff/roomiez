class AddPhotoToApartments < ActiveRecord::Migration
  def change
  	add_attachment :apartments, :photo
  end
end
