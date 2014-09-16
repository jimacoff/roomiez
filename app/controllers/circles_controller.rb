class CirclesController < ApplicationController

  def index
    @circles = Circle.all
  end

  def add
    @circle = Circle.add_user_to_circle(current_user, params[:user_to_add])

    if @circle && @circle.save
      redirect_to user_path(current_user), notice: 'Member was successfully added to circle!'	
    elsif @circle == false
      redirect_to user_path(current_user), notice: 'User already in circle!'
    else
      redirect_to user_path(current_user), notice: 'An error occurred, and the member could not be added to a circle.'
    end
  end

  def show
    @circle = Circle.all
  end

end
