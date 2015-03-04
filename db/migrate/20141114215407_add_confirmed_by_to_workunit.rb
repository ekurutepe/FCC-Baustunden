class AddConfirmedByToWorkunit < ActiveRecord::Migration
  def change
    add_reference :workunits, :confirmed_by_id, index: true
  end
end
