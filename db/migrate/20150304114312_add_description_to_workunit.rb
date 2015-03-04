class AddDescriptionToWorkunit < ActiveRecord::Migration
  def change
    add_column :workunits, :description, :string
  end
end
