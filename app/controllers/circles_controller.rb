class CirclesController < ApplicationController

	def create
		@circle = Circle.self.add_user_to_circle(current_user, params[:id])

		if @group.save
			redirect_to user_path, notice: 'Member was successfully added to circle!'	
		else
			redirect_to user_path, notice: 'Member could not be added'
		end
	end

	def show
		@circle = Circle.all
	end


end