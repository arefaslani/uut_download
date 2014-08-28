class RenameLinksTypeToProtocol < ActiveRecord::Migration
  def change
    rename_column :links, :type, :protocol
  end
end
