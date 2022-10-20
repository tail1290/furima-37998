class OrderForm < ApplicationRecord
  include ActiveModel::Model

  attr_accessor :user_id, :product_id, :postcode, :area_ken_id, :city, :block, :building, :phone_number, :token

  
  with_options presence: true do
  
    validates :user_id
    validates :product_id
    
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :area_ken_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :city
    validates :block
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
   
    Payment.create(order_id: order.id, postcode: postcode, area_ken_id: area_ken_id, city: city, block: block, building: building, phone_number: phone_number)
  end
end
