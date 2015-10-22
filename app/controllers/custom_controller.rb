class CustomController < ApplicationController
layout 'apartments'

  def design
	 @order = Order.new	
   if params[:apartment] && @apartment = Apartment.friendly.find(params[:apartment])
    @order.apartment_address = @apartment.address
    @order.city = @apartment.city
   end
  end

  def create
    
  	@order = Order.new(permit_params)
  	if @order.save
  	    respond_to do |format|
  			 format.html
  		  end
  	else
  		render 'design'
  	end
  end

  private
  	def permit_params
  		params.require(:order).permit(:order_type,:name,:email,:mobile,:flat,:apartment_address,:city,:special_request, :tower, :apartment_name)
  	end
end
