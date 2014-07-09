class CirclesController < ApplicationController


	def index
		@circles = Circle.all
	end



	def add
		if !current_user.landlord && current_user.memberships.any?
			redirect_to user_path(current_user), notice: 'You already have a circle! Leave your current circle to join a different one.'

		else 
			@circle = Circle.add_user_to_circle(current_user, params[:user_to_add], params[:join_other_circle])

			if @circle && @circle.save
				redirect_to user_path(current_user), notice: 'Member was successfully added to circle!'	
			elsif @circle == false
				redirect_to user_path(current_user), notice: 'User already in circle!'
			else
				redirect_to user_path(current_user), notice: 'An error occurred, and the member could not be added to a circle.'
			end
		end
	end


	def show
		@circle = Circle.all
	end


end