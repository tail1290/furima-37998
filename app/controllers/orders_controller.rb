class OrdersController < ApplicationController


  before_action :authenticate_user!
  before_action :non_purchased_product, only: [:index, :create]

  def index
    @product = Product.find(params[:product_id])
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_product
      @order_form.save

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

  def order_params
    params.require(:order_form).permit(:postcode, :area_ken_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.value,       
      card: order_params[:token],
      currency: 'jpy'             
    )
  end

  def non_purchased_product
    @product = Product.find(params[:product_id])
    redirect_to root_path if current_user.id == @product.user_id 
  end


  def index

    @product = Product.find(params[:product_id])
    @order   = Order.new
 
  end

  def create
    
    @product = Product.find(params[:product_id])
    @order   = Order.new
    if @order.save!
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
