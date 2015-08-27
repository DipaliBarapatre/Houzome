module Api
class ApartmentsController < ApplicationController
  def show
  	@apartment = Apartment.find(params[:id])
  	@data = @apartment.towers.includes(:flats).collect{|t| {tower: t.name, flats: parse(t.flats) }}
  	render json: @data
  end

  private
  	def parse(flats)
  		flats.inject([]){|arr, flat| arr | flat.numbers }.collect{|v| {key: v, val: v}}
  	end
end
end