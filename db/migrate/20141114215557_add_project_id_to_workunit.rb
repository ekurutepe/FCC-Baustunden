class AddProjectIdToWorkunit < ActiveRecord::Migration
  def change
    add_reference :workunits, :project, index: true
  end
end
