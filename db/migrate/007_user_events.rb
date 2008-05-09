class UserEvents < ActiveRecord::Migration
    def self.up
        add_column :events, :user_id, :integer, :default => 1
    end
    
    def self.down
        remove_column :events, :user_id
    end
end
