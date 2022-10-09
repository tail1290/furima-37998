class OrdersController < ApplicationController

  def index
    @product = Product.find(params[:product_id])
    @buyer = Buyer.new
  end

  def create
    @buyer = Buyer.new(buyer_params)

    if @buyer.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def buyer_params
    params.require(:buyer).permit(:postal_code, :area_ken_id, :city_name, :block_name, :build_name, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], ).merge(user_id: current_user.id, product_id: params[:product_id])
  end
  
  
end
