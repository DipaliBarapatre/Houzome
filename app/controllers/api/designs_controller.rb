module Api
class DesignsController < ApplicationController
  def index
    @designs =  Apartment.find(params[:apartment_id]).towers.find_by_name(params[:tower]).flats.at(params[:flat]).first.designs
    render json: @designs
  end

  private
  	def make_hash(arr)
  		arr.collect{|i| {key: i, val: i}}
  	end
end
end