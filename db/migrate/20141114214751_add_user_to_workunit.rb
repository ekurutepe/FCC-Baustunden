class AddUserToWorkunit < ActiveRecord::Migration
  def change
    add_reference :workunits, :user, index: true
  end
end
