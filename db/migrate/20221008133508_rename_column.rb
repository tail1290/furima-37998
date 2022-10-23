class RenameColumn < ActiveRecord::Migration[6.0]
  def change
    rename_column :payments, :prefecture_id, :area_ken_id
  end
end
