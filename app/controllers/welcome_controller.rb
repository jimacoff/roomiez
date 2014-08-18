class WelcomeController < ApplicationController
  def about
  end

  def home
    if user_signed_in? 
      redirect_to "/users/#{current_user.id}"
    end 
  end

  def contact
    render 'contact'
  end

  def about
    render 'about'
  end

end

