class DesignsController < ApplicationController
  layout 'apartments'
  
  def show
	@design = Design.friendly.includes(:images).find(params[:id])
	unless params[:apartment].blank?
		@apartment = Apartment.friendly.find(params[:apartment])
		@flat = @apartment.towers.find_by_name(params[:tower]).flats.at(params[:flat])
		@order = Order.new
	end
  end
end