class RsvpVisited < ActiveRecord::Migration
    def self.up
        add_column :rsvps, :visited_at, :timestamp
    end

  def self.down
  end
end
