class ApartmentsController < ApplicationController
	before_action :set_apartment, only: [:show, :edit, :update, :destroy]

	def index
		# @apartments = Apartment.all
		if params[:user_id]
			@apartments = Apartment.where(:user_id => params[:user_id]).paginate(:per_page =>10, :page => params[:page])
		else
			@apartments = Apartment.filter(params[:q]).paginate(:per_page =>10, :page => params[:page])	
		end
	end

	def new
   		@apartment = Apartment.new
  	end

	def create
		@apartment = Apartment.new(apartment_params)
		@apartment.user_id = current_user.id

		if @apartment.save
			redirect_to "/users/#{current_user.id}/apartments"
		else
      		render :new
    	end
	end

	def edit
	end

	def update
		# @apartment = Apartment.edit
  		if @apartment.update(apartment_params)
    		redirect_to "/users/#{current_user.id}/apartments", notice: 'Apartment was successfully updated.'
  		else
    		render :edit
  		end
	end


	def show
		#@apartment = Apartment.find(params[:id])
		@apartments = Apartment.all

	end

	def destroy
		@apartment.destroy
		redirect_to "/users/#{current_user.id}/apartments"
	end



	private


	def set_apartment
      @apartment = Apartment.find(params[:id])
    end

	def apartment_params
      params.require(:apartment).permit(:name, :street_address, :occupied, :country, :zipcode, :user_id, :photo)
  end
end