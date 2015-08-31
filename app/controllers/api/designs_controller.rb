module Api
class DesignsController < ApplicationController
  def index
  	@flat = Apartment.find(params[:apartment_id]).towers.find_by_name(params[:tower]).flats.at(params[:flat]).first
    @designs = @flat.designs
    render json: [@designs, @flat]
  end

  private
  	def make_hash(arr)
  		arr.collect{|i| {key: i, val: i}}
  	end
end
end