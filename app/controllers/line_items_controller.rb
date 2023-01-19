class LineItemsController < ApplicationController

	def create
    chosen_product = Product.find(params[:product_id])
    current_cart = @current_cart
    @line_item = LineItem.new
    @line_item.cart = current_cart
    @line_item.product = chosen_product
  	@line_item.save
  	redirect_to cart_path(current_cart)
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy
    redirect_to cart_path(@current_cart)
  end
    
  private
  
  def line_item_params
    params.require(:line_item).permit(:quantity,:product_id, :cart_id)
  end
  
end
