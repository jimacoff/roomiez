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



	def destroy

		@membership = Membership.find(params[:id])
    	@membership.destroy

		# current_user.memberships.first.destroy
		redirect_to "/users/#{current_user.id}" 
	end

end