module Hzadmin
class OrdersController < BaseController 
# before_filter :authenticated?
layout 'admin'

  def index
    @orders = Order.all
  end

  def show
    @order = Order.find_by_number(params[:id])
  end

  def update
    @order = Order.find_by_number(params[:id])
    if @order.update(:aasm_state => params[:order][:aasm_state], :edd => params[:order][:edd], :price => params[:order][:price].blank? ? '0' : params[:order][:price])
      flash[:success] = "ORDER UPDATED"
      render 'show'
    end
  end
end
end