class CreateLocations < ActiveRecord::Migration
    def self.up
        create_table :locations do |t|
            t.timestamps
            t.column :name, :string
            t.column :address, :string
            t.column :city, :string
            t.column :state, :string, :limit => 2
            t.column :zip, :int, :limit => 5
            t.column :phone, :string
        end
    end
    
    def self.down
        drop_table :locations
    end
end
