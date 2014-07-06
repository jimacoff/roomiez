class CirclesController < ApplicationController

	def create
		@circle = Circle.new(params[:group])
		@cicle.users << current_user

		if @group.save
			# ... etc	
		end
	end

end