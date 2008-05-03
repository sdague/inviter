class CreateEvents < ActiveRecord::Migration
    def self.up
        create_table :events do |t|
            t.timestamps
            t.column :name, :string, :null => false
            t.column :description, :text
            t.column :seed, :string
            t.column :date, :date
            t.column :start, :time
            t.column :location_id, :int, :null => false
        end
    end
    
    def self.down
        drop_table :events
    end
end
