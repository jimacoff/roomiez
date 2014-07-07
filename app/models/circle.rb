class Circle < ActiveRecord::Base
	has_many :memberships
	has_many :users, through: :memberships


	def self.new
		@circle = Circle.add_user_to_circle(current_user, params[:id])
	end

	def self.add_user_to_circle(current_user, user_to_add)
		if current_user.circles.empty? && user_to_add.circles.empty?
			@circle = Circle.new
			@circle.users << current_user
			@circle.users << user_to_add
		elsif current_user.circles && user_to_add.circles.empty?
			current_user.circles.first << user_to_add
		elsif current_user.circles.empty? && user_to_add.circles
			user_to_add.circles.first << current_user
		else
			current_user.circles.first << user_to_add.circles.first.users
			user_to_add.circles.first.destroy

		end		
	end

end
