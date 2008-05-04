require 'digest/md5'
class Rsvp < ActiveRecord::Base
    belongs_to :person
    belongs_to :event

    
    def Rsvp.states
        return ["yes", "no", "maybe", "na"]
    end
    
    def key=(value)
        # do nothing
    end

    def key
        return Digest::MD5.hexdigest(self.event.seed + self.person.email)
    end
end
