class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|

      t.string     :postal_code,  null: false
      t.integer    :area_ken_id,  null: false
      t.string     :city_name,    null: false
      t.string     :block_name,   null: false
      t.string     :build_name
      t.string     :phone_number, null: false
      t.references :order,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
