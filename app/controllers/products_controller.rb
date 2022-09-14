class ProductsController < ApplicationController
  
  before_action :move_to_edit, only: [:edit, :update]
  before_action :set_to_edit, only: [:edit, :update]
  before_action :authenticate_user!, only: :new
  
  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(params[:id])
    @user = User.find_by(id: @product.user_id)
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:value, :product_name, :product_text, :category_id, :condition_id, :load_id, :date_shipment_id, :area_ken_id, :image).merge(user_id: current_user.id)
  end

  def move_to_edit
    @product = Product.find(params[:id])
    @user = @product.user
    unless @user == current_user
      redirect_to user_session_path
    end
  end

  def set_to_edit
    @product = Product.find(params[:id])
  end

end
