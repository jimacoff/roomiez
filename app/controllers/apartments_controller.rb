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
		if params[:add_to_circle]
			if @apartment.add_to_circle(current_user)
				redirect_to user_path(current_user), notice: 'Apartment was successfully added to circle!'				
			else
				redirect_to user_path(current_user), notice: 'You need a circle of friends before adding an apartment!'
			end
		else
			if @apartment.update(apartment_params)
   				redirect_to "/users/#{current_user.id}/apartments", notice: 'Apartment was successfully updated.'
 			else
   			render :edit 
   		end
  	end
	end


	def show
		#@apartment = Apartment.find(params[:id])
		@apartments = Apartment.all

	end

	def destroy
		if params[:remove_apt_from_circle]
			if @apartment.remove_from_circle
				redirect_to user_path(current_user), notice: 'Apartment was successfully removed circle!'
			else
				redirect_to user_path(current_user), notice: 'Apartment could not be removed'
			end
		else
			@apartment.destroy
			redirect_to "/users/#{current_user.id}/apartments"
		end
	end


	private

	def set_apartment
      @apartment = Apartment.find(params[:id])
    end

	def apartment_params
      params.require(:apartment).permit(:name, :street_address, :occupied, :country, :zipcode, :user_id, :photo, :rent, :city, :state, :bedrooms, :bathrooms, :smoking, :pets, :furnished)
  end
end