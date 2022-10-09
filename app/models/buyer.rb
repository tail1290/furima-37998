class Buyer < ApplicationRecord

  include ActiveModel::Model
  attr_accessor :postal_code, :area_ken_id, :city_name, :block_name, :build_name, :phone_number, :product_id, :user_id

  with_options presence: true do
    validates :city_name, :block_name
    validates :area_ken_id, numericality: { other_than: 1 }
    validates :phone_number, format: { with: /\A\d{11}\z/ }
    
    with_options format: { with: /\A\d{3}[-]\d{4}\z/ } do
      validates :postal_code, length: { is: 8 } 
    end
  end
end
