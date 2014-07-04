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

		if @apartment.save
			redirect_to ""
		else
      		render :new
    	end
	end

	# def edit
	# end

	def update
		# @apartment = Apartment.edit

		respond_to do |format|
	  		if @apartment.update(apartment_params)
	    		format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
	    		format.json { render :show, status: :ok, location: @apartment }
	  		else
	    		format.html { render :edit }
	    		format.json { render json: @apartment.errors, status: :unprocessable_entity }
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