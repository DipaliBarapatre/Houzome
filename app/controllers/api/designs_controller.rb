module Api
class DesignsController < ApplicationController
  def index
    @designs = Design.with_bhk(params[:flat].split('-').first)
    render json: @designs
  end

  private
  	def make_hash(arr)
  		arr.collect{|i| {key: i, val: i}}
  	end
end
end