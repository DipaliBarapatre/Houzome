module Hzadmin
class FlatsController < ApplicationController
  layout 'admin'
  before_filter :default_vars

    def new
    	@flat = Flat.new
    end

    def create
    	@flat = Flat.new(permit_params.slice(:floor_plan_id, :fp, :numbers, :tower_ids))
    	if @flat.save
    		flash[:success] = "Flat Created"
    		redirect_to builder_apartment_path(params[:flat][:builder_id], params[:flat][:apartment_id])
    	else
    		render 'new'
    	end
    end


  private
  	def default_vars
  	  @apartment = Apartment.find(params[:apartment_id])
  	  @builder = @apartment.builder
  	end

  	def permit_params
      params[:flat][:numbers] = params[:flat][:numbers].split(',')
  		params.require(:flat).permit(:floor_plan_id, :fp, :apartment_id, :builder_id, numbers: [], tower_ids: [])
  	end
end
end