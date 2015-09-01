module Api
class ApartmentsController < ApplicationController
  def show
  	@apartment = Apartment.friendly.find(params[:id])
  	@data = @apartment.towers.includes(:flats).collect{|t| {tower: t.name, flats: parse(t.flats) }}
  	render json: @data
  end

  private
  	def parse(flats)
  		flats.inject([]){|arr, flat| arr | flat.numbers }.sort{|a,b| a.to_i <=> b.to_i}.collect{|v| {key: v, val: v}}
  	end
end
end