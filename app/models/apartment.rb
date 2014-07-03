class Apartment < ActiveRecord::Base
	belongs_to :user
	has_many :tasks
	

	def self.filter(query)
		query.blank? ? Apartment.all : Apartment.where("name LIKE '%#{"query"}%'")
	end
	
end