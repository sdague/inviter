require 'digest/md5'
class Rsvp < ActiveRecord::Base
    belongs_to :person
    belongs_to :event

    def url
        key = Digest::MD5.hexdigest(self.event.seed + self.person.email)
        return "http://localhost:3000/invite/show/#{self.id}?key=#{key}"
    end
end
