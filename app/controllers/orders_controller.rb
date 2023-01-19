class OrdersController < ApplicationController
  
  def index
    @orders = Order.includes(:product, :user).where(user_id: current_user.id)
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new
    @current_cart.line_items.each do |item|
      @order.product_id = item.product_id
      @order.user_id = current_user.id
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
  end

end