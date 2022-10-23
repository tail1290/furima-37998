class OrdersController < ApplicationController


  before_action :authenticate_user!
  before_action :non_purchased_product, only: [:index, :create]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      pay_product
      @order_form.save
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

    if current_user.id == @product.user_id or  @product.order.nil?
      redirect_to root_path
    end
  end

end
