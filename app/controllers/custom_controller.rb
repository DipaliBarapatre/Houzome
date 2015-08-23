class CustomController < ApplicationController
layout 'apartments'

  def design
	@order = Order.new	
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
  		params.require(:order).permit(:order_type,:name,:email,:mobile,:flat,:apartment_address,:city,:special_request)
  	end
end