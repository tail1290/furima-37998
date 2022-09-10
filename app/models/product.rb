class Product < ApplicationRecord
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :load
  belongs_to :date_shipment
  belongs_to :area_ken

  belongs_to :user

  validates :value, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
  format: { with: /\A[0-9]+\z/ }

  validates :value, :product_name, :product_text, presence: true

  validates :category_id, :condition_id, :load_id, :date_shipment_id, :area_ken_id, numericality: { other_than: 1 }

  validates :image, presence: true

end
