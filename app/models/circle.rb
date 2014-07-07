class Circle < ActiveRecord::Base
	has_many :memberships
	has_many :users, through: :memberships


	# def self.new
	# 	@circle = Circle.add_user_to_circle(current_user, params[:id])
	# end

	def self.add_user_to_circle(current_user, user_to_add, join_other_circle)
		# Current_user wants to room with user_to. Neither have a circle. Create a new circle and add both
		if current_user.circles.empty? && user_to_add.circles.empty?
			@circle = Circle.new
			@circle.users << current_user
			@circle.users << user_to_add
		# User1 has a circle. User1 is adding User2 to his/her circle
		elsif current_user.circles && user_to_add.circles.empty?
			current_user.circles.first << user_to_add
		# current_user does not have a circle and wants to be added to circle of user_to
		elsif current_user.circles.empty? && user_to_add.circles
			user_to_add.circles.first << current_user
		# current_user and user_to both have circles. user_to is added to circle of current_user
		elsif current_user.circles && user_to_add.circles 
			#Currrent user will join user_to_add circle
			if join_other_circle == true
				user_to_add.circles.first << current_user.circles.first.users
				current_user.circles.first.destroy
			#user_to_add will join current_user circle	
			elsif join_other_circle == false
				current_user.circles.first << user_to_add.circles.first.users
				user_to_add.circles.first.destroy
			end
		else
			flash[:error] = "Invalid option!"
		end		
	end

end
