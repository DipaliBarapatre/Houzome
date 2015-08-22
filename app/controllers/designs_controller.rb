class DesignsController < ApplicationController
  layout 'apartments'
  
  def show
	@design = Design.friendly.includes(:images).find(params[:id])
	@apartment = Apartment.find(params[:apartment])
	@flat = @apartment.towers.find_by_name(params[:tower]).flats.at(params[:flat].split('-')[1])
	@order = Order.new
  end
end