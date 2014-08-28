class ChangeUserIdFromIntegerToString < ActiveRecord::Migration
  def change
    change_column :links, :user_id, :string
  end
end
