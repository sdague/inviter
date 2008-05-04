require 'digest/md5'

class InviteController < ApplicationController
    def show
        @rsvp = Rsvp.find(params[:id])
        @key = params[:key]
        l = @rsvp.event.location
        @address = "#{l.address}, #{l.city}, #{l.state}"

        event = @rsvp.event
        person = @rsvp.person
        
        if @key != Digest::MD5.hexdigest(event.seed + person.email)
            redirect_to(:controller => "sorry")
            return
        end
    end

    def update
        @key = params[:key]
        @rsvp = Rsvp.find(params[:id])
        if @key != Digest::MD5.hexdigest(@rsvp.event.seed + @rsvp.person.email)
            redirect_to(:controller => "sorry")
            return
        end
        @rsvp.person.name = params[:name]
        @rsvp.person.email = params[:email]
        @rsvp.num = params[:num]
        @rsvp.state = params[:state]
        @rsvp.response = params[:response]
        
        # in case they change their email
        @key = Digest::MD5.hexdigest(@rsvp.event.seed + @rsvp.person.email)
        
        @rsvp.person.save
        @rsvp.save
        
        respond_to do |format|
            format.html { redirect_to(:action => "show", :id => @rsvp.id, :key => @key) }
        end
    end
end
