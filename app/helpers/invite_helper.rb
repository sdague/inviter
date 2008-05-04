module InviteHelper

    def address(location)
        return "#{location.name}<br/>#{location.address}<br/>#{location.city}, #{location.state} #{location.zip}"
        
    end
    
    def yes_list()
        list_by_state("yes")
    end

    def no_list()
        list_by_state("no")
    end
    
    def maybe_list()
        list_by_state("maybe")
    end
    
    def na_list()
        list_by_state("na")
    end

    def yes_number()
        number_by_state("yes")
    end

    def no_number()
        number_by_state("no")
    end
    
    def maybe_number()
        number_by_state("maybe")
    end
    
    def na_number()
        number_by_state("na")
    end
    
    def number_by_state(state)
        rsvps = Rsvp.find(:all, :conditions => ["state = ?", state])
        count = 0
        rsvps.each do |r|
            count += (r.num or 1)
        end
        return count
    end
    
    def list_by_state(state)
        Rsvp.find(:all, :conditions => ["state = ?", state])
    end 

    def format_invitee(r)
        return "<tr valign='top'><td>#{r.person.name or r.person.email}</td><td>#{r.num or 1}</td><td>#{r.response}</td></tr>"
    end

end
