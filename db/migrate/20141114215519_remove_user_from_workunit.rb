class RemoveUserFromWorkunit < ActiveRecord::Migration
  def change
    remove_reference :workunits, :user, index: true
  end
end
