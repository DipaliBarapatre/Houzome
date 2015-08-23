module Api
class ApartmentsController < ApplicationController
  def show
  	@apartment = Apartment.find(params[:id])
  	@data = @apartment.towers.includes(:flats).collect{|t| {tower: t.name, flats: parse(t.flats) }}
  	render json: @data
  end

  private
  	def parse(flats)
  		flats.inject([]){|arr, flat| floor_plan = flat.floor_plan_id; dat = flat.numbers.collect{|num| {key: num, val: num}}; dat}
  	end
end
end