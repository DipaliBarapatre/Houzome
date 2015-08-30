class Dashboard::OrdersController < ApplicationController
	layout 'dashboard'
	def index
		@orders = Order.my_orders(current_user.email)
	end

	def show
		@order = Order.friendly.find(params[:id])
	end
end