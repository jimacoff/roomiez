class MembershipsController < ApplicationController

	def index
		@memberships = Membership.all
	end

	def new
   		@membership = Membership.new
  	end

	def create
		@membership = Membership.new(membership_params)

		if @membership.save
			redirect_to "/users/#{current_user.id}"
		else
      		render :new
    	end
	end

	def add 
		#testing for the 3 cases
		if current_user !=
	end

end