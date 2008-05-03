class CreatePeople < ActiveRecord::Migration
    def self.up
        create_table :people do |t|
            t.timestamps
            t.column :name, :string
            t.column :email, :string
        end
    end
    
    def self.down
        drop_table :people
    end
end
