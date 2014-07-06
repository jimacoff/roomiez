class Circle < ActiveRecord::Base
	has_many :memberships
	has_many :users, through: :memberships


	def self.add_user_to_circle(...)

	end

end

# another file


Circle.add_user_to_circle(current_user, )