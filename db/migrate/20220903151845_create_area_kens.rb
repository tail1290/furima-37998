class CreateAreaKens < ActiveRecord::Migration[6.0]
  def change
    remove_colum :orders, :user_id,:string
  end
end
