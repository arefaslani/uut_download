class ChangeUserPrimaryKey < ActiveRecord::Migration
  def up
    execute "ALTER TABLE users DROP CONSTRAINT users_pkey;"
    remove_column :users, :id
    execute "ALTER TABLE users ADD PRIMARY KEY (student_number);"
  end

  def down
    execute "ALTER TABLE users DROP CONSTRAINT users_pkey;"
    add_column :users, :id, :primary_key
  end
end
