class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :type
      t.string :address

      t.timestamps
    end
  end
end
