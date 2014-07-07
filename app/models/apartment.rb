class Apartment < ActiveRecord::Base
	belongs_to :user
	belongs_to :circle
	has_many :tasks
	
	#Does stuff that has to do with photo upload
	has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/face.jpeg"
 	 validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

	def self.filter(query)
		query.blank? ? Apartment.all : Apartment.where("street_address LIKE '%#{query}%'")
	end
	
end