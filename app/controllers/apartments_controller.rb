class ApartmentsController < ApplicationController

	def index
		@apartments = Apartment.all
		# @apartments = Apartment.filter(params[:q])	
	end

	def new
   		@apartment = Apartment.new
  	end

	def create
		@apartment = Apartment.new(apartment_params)

		@apartment.user_id = current_user.id


		respond_to do |format|	
			if @apartment.save
				format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
				format.json { render :show, status: :created, location: @apartment }
			else
				format.html { render :new }
				format.json { render json: @task.errors, status: :unprocessable_entity }
			end
		end

	end



	def show
		@apartments = Apartment.all

	end

	private

	def apartment_params
      params.require(:apartment).permit(:name, :street_address, :occupied, :country, :zipcode, :user_id)
    end

end