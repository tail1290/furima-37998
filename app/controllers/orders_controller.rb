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
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    # この時点では、order_idが不要。またrequire外の情報は参照するため、mergeとする。
    params.require(:order_form).permit(:postcode, :area_ken_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @product.value,        # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'             # 通貨の種類（日本円）
    )
  end

  def non_purchased_product
    # itemがあっての、order_form（入れ子構造）。他のコントローラーで生成されたitemを使うにはcreateアクションに定義する。
    @product = Product.find(params[:product_id])
    redirect_to root_path if current_user.id == @product.user_id 
  end

end
