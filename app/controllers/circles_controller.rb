class CirclesController < ApplicationController

	def add(:user_to_add, :join_other_circle)
		@circle = Circle.add_user_to_circle(current_user, :user_to_add, :join_other_circle)
		if @circle.save
			redirect_to user_path, notice: 'Member was successfully added to circle!'	
		else
			redirect_to user_path, notice: 'Member could not be added'
		end


	end


	# def create
	# 	@circle = Circle.add_user_to_circle(current_user, params[:id])

	# 	if @circle.save
	# 		redirect_to user_path, notice: 'Member was successfully added to circle!'	
	# 	else
	# 		redirect_to user_path, notice: 'Member could not be added'
	# 	end
	# end

	def show
		@circle = Circle.all
	end

end