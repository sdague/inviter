class UserLocations < ActiveRecord::Migration
    def self.up
        add_column :locations, :user_id, :int, :default => 1
    end

    def self.down
        remove_column :locations, :user_id
    end
end
