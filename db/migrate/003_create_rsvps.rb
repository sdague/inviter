class CreateRsvps < ActiveRecord::Migration
    def self.up
        create_table :rsvps do |t|
            t.timestamps
            t.column :person_id, :int, :null => false
            t.column :event_id, :int, :null => false
            t.column :state, :string
            t.column :num, :int
            t.column :response, :text
        end
    end
    
    def self.down
        drop_table :rsvps
    end
end
