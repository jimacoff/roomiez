class UsersController < ApplicationController

	def index
		@users = User.filter(params[:q])
	end


	def show
		@user = current_user
	end


	# def about
	# 	param(:id)
	# end

	private

	def user_params
    	params.require(:user).permit(:name, :email, :about, :age, :landlord)
    end

end

