class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :workunits, :performed_by_id, :performed_by_user_id
    rename_column :workunits, :confirmed_by_id, :confirmed_by_user_id
  end
end
