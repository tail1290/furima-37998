class AddProductToBuyers < ActiveRecord::Migration[6.0]
  def change
    add_reference :buyers, :product, null: false, foreign_key: true
  end
end
