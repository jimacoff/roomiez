class ReviewsController < ApplicationController

  def index
    @review = Review.all
  end


  def new
    @review = Review.new
  end


  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.apartment_id = 1

    if @review.save
      redirect_to user_apartment_path(current_user.id, @review.apartment_id)
    else
      render :new
    end
  end

  def edit
  end
  
  private
    def review_params
      params.require(:review).permit(:rating, :body, :apartment_id)
    end

end 
