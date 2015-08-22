class ApartmentsController < ApplicationController
  def index
	@q = Apartment.ransack(params[:q])
  	@apartments = @q.result(distinct: true).page(params[:page]).per(10)
  end

  def show
  	@apartment = Apartment.find(params[:id])
  end
end
