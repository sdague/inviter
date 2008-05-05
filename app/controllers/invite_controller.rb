require 'digest/md5'

class InviteController < ApplicationController
    around_filter :catch_exceptions

    private
    def catch_exceptions
        yield
    rescue => exception
        logger.debug "Caught exception! #{exception}"
        redirect_to(:controller => "sorry")
    end
    
    public 
    
    def show
        @rsvp = Rsvp.find(params[:id])
        key = params[:key]
        l = @rsvp.event.location
        @address = "#{l.address}, #{l.city}, #{l.state}"

        @person = @rsvp.person
        
        if key != @rsvp.key
            redirect_to(:controller => "sorry")
            return
        end
    end

    def update
        rsvp = params[:rsvp]
        person = params[:person]
        
        @rsvp = Rsvp.find(rsvp[:id])
        if rsvp[:key] != Digest::MD5.hexdigest(@rsvp.event.seed + @rsvp.person.email)
            redirect_to(:controller => "sorry")
            return
        end
        oldemail = @rsvp.person.email
        
        @rsvp.person.update_attributes(person)
        @rsvp.update_attributes(rsvp)
                
        if oldemail != @rsvp.person.email
            InviteMailer.deliver_changed(@rsvp)
        end
        
        respond_to do |format|
            format.html { redirect_to(:action => "show", :id => @rsvp.id, :key => @rsvp.key) }
        end
    end
end
