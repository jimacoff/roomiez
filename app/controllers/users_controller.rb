class UsersController < ApplicationController

  def index
    @users = User.filter(params[:q])
    # @users.each do |user|

    # end
  end


  def show
    @user = User.find(params[:id])
    # Creates an array of the membership ids that tie the current user to their circles
    @memberships = []
    @user.circles.each do |c|
      c.memberships.each do |m|
	if @user.id == m.user_id.to_i
	  @memberships << m.id
	end
      end
    end
  end


  def edit
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :about, :age, :landlord, :photo_file_name)
  end

end

