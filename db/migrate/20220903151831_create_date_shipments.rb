class CreateDateShipments < ActiveRecord::Migration[6.0]
  def change
    create_table :date_shipments do |t|

      t.timestamps
    end
  end
end