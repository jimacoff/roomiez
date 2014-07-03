class ApartmentsController < ApplicationController
	def index
		@apartments = Apartment.filter(params[:q])	
	end


end