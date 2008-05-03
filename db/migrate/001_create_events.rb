class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :description
      t.string :seed
      t.date :date
      t.time :start
      t.int :location_id

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
