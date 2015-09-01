class OrdersController < ApplicationController
  
  def create
  	@apartment = Apartment.friendly.find(params[:order][:apartment_id])
  	params[:order][:apartment_id] = @apartment.id
	@order = Order.new(permit_params)
	if @order.save
	    respond_to do |format|
			format.js
		end
	else
		render js: "$(\".modal-state:checked\").prop(\"checked\", false).change();swal('Oops...', '#{@order.errors.full_messages}', 'error')"
	end
  end

  private
  	def permit_params
  		params.require(:order).permit(:apartment_id, :email, :flat, :mobile, :name, :order_type, :design_id)
  	end
end
