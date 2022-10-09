class Delete < ActiveRecord::Migration[6.0]
  def change
    drop_table :buyers

    drop_table :orders
  end
end
