require 'digest/md5'
class Rsvp < ActiveRecord::Base
    belongs_to :person
    belongs_to :event

    def key
        return Digest::MD5.hexdigest(self.event.seed + self.person.email)
    end
end
