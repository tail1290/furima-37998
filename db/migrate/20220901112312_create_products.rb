class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string     :value,           null: false
      t.string     :product_name,    null: false
      t.text       :product_text,    null: false
      t.integer    :category_id,     null: false
      t.integer    :condition_id,    null: false
      t.integer    :load_id,         null: false
      t.integer    :date_shipment_id,null: false
      t.integer    :area_ken_id,     null: false
      t.references :user_id,         null: false,foreign_key: true

      t.timestamps
    end
  end
end
