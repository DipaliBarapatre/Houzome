module Api
class DesignsController < ApplicationController
  def index
  	@flat = Apartment.find(params[:apartment_id]).flats.at(params[:flat]).first
    @designs = @flat.designs
    @fp_url = @flat.fp_url
    render json: {designs: @designs, floor_plan: @fp_url}
  end

  private
  	def make_hash(arr)
  		arr.collect{|i| {key: i, val: i}}
  	end
end
end