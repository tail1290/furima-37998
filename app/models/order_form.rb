class OrderForm < ApplicationRecord
  include ActiveModel::Model
  # order_idは、保存されたタイミングで生成されるため、attr_accessorにおいて不要なカラムとなる（書くと蛇足なのでエラー）
  attr_accessor :user_id, :product_id, :postcode, :area_ken_id, :city, :block, :building, :phone_number, :token

  # 4行目と同じくこのタイミングでは生成前なので「validates :order_id」は不要
  with_options presence: true do
    # orderモデルのバリデーション
    validates :user_id
    validates :product_id
    # paymentモデルのバリデーション
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_ken_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: 'is invalid' }
    # トークンのバリデーション
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    # ストロングパラメーターでデータが運ばれ、それらが保存のタイミングで「order_id」が生成され、保存される。
    Payment.create(order_id: order.id, postcode: postcode, area_ken_id: area_ken_id, city: city, block: block, building: building, phone_number: phone_number)
  end
end
