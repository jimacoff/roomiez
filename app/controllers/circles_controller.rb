class CirclesController < ApplicationController




	def add
		@circle = Circle.add_user_to_circle(current_user, params[:user_to_add], params[:join_other_circle])
		#binding.pry

		if @circle && @circle.save
			redirect_to user_path(current_user), notice: 'Member was successfully added to circle!'	
		else
			redirect_to user_path(current_user), notice: 'An error occurred, and the member could not be added to a circle.'
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