class Circle < ActiveRecord::Base
	has_many :memberships, :dependent => :destroy
	has_many :users, through: :memberships

	# def self.new
	# 	@circle = Circle.add_user_to_circle(current_user, params[:id])
	# end

	def self.add_user_to_circle(current_user, user_to_add, join_other_circle)
		circle = nil
		user = User.find(user_to_add)
		# Current_user wants to room with user_to. Neither have a circle. Create a new circle and add both

		if current_user.circles.empty? && user.circles.empty?
			circle = Circle.new
			circle.users << current_user
			circle.users << user
		# User1 has a circle. User1 is adding User2 to his/her circle
		elsif current_user.circles.any? && user.circles.empty?
			circle = current_user.circles.first
			circle.users << user
		# current_user does not have a circle and wants to be added to circle of user_to
		elsif current_user.circles.empty? && user.circles.any?
			circle = user.circles.first
			circle.users << current_user
		# current_user and user_to both have circles. user_to is added to circle of current_user
		elsif current_user.circles.any? && user.circles.any?
			#Currrent user will join user_to_add circle
			if join_other_circle == "1"
				circle = user.circles.first
				if !circle.users.include?(current_user)
					circle.users << current_user.circles.first.users
					current_user.circles.first.destroy
				else
					return false
				end
			#user_to_add will join current_user circle	
			elsif join_other_circle == "0"
				circle = current_user.circles.first
				if !circle.users.include?(user)
					# pry(Circle)> circle.users.include?(User.where(:name => "Sabra"))
					circle.users << user.circles.first.users
					user.circles.first.destroy
				else
					return false
				end
			end
		end		
		circle
	end

end


