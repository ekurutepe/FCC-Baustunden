class CreateWorkunits < ActiveRecord::Migration
  def change
    create_table :workunits do |t|
      t.date :performed_at
      t.decimal :duration
      t.datetime :confirmed_at

      t.timestamps
    end
  end
end
