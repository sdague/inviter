class Event < ActiveRecord::Base
    has_many :rsvps
    belongs_to :location
end
