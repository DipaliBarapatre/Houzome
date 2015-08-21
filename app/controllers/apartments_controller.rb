class ApartmentsController < ApplicationController
  def index
	  	
  end

  def show
  	@apartment = Apartment.find(params[:id])
  end
end
