class ModifyWorkflowDurationDefault < ActiveRecord::Migration
  def change
        change_column(:workunits, :duration, :decimal, precision: 15, scale: 2, default: 0)
  end
end
