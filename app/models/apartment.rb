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

	# change the apt.circle_id to current cricle
	def add_to_circle(current_user)
		# if usert has a circle then he/she can add an apt
		if current_user.memberships.any?
			self.circle_id = current_user.memberships.first.circle_id
			# add apartment's landlord to circle
			# change landlord's circle_id to match current circle
			landlord = User.find(self.user_id)
			circle = Circle.find(self.circle_id)
			circle.users << landlord
			
		else
			redirect_to user_path(current_user), notice: 'You need a circle of friends before adding an apartment!'
		end
	end

end