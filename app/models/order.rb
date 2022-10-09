class Order < ApplicationRecord
<<<<<<< Updated upstream
  belongs_to :user
  belongs_to :product
  has_one :payment
=======

  belongs_to :product, optional: true
  belongs_to :user, optional: true

  validate :product_id
  validate :sec_coad
  validate :card_no
  validate :limit_year
  validate :limit_month
  validate :build_name

  validates :phone_no,  format: { with: /\A\d{10,11}\z/ }
  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/ }
  validates :area_ken_id, numericality: { other_than: 1 }
  
  validates :post_code, :address_name, :address_no, :phone_no, presence: true
  
>>>>>>> Stashed changes
end