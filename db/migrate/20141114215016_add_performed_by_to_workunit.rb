class AddPerformedByToWorkunit < ActiveRecord::Migration
  def change
    add_reference :workunits, :performed_by_id, index: true
  end
end
