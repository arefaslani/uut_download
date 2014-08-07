class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :student_number
      t.string :email
      t.string :password_digest

      t.timestamps
    end

    add_index :users, :student_number, unique: true
    add_index :users, :email, unique: true
  end
end