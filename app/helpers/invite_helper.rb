module InviteHelper

    def address(location)
        return "#{location.name}<br/>#{location.address}<br/>#{location.city}, #{location.state} #{location.zip}<br/>#{location.phone}"
        
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
        rsvps = Rsvp.find(:all, :conditions => ["state = ?", state]).sort_by {|s| s.person.email}
        count = 0
        rsvps.each do |r|
            count += (r.num or 1)
        end
        return count
    end
    
    def list_by_state(state)
        Rsvp.find(:all, :conditions => ["state = ?", state]).sort_by {|s| s.person.email}
    end 

    def format_invitee(r)
        name = r.person.name
        if (not name) or (name.length < 1)
            name = r.person.email.sub(/@.*/, "")
        end
        return "<tr valign='top'><td>#{h(name)}</td><td>#{r.num or 1}</td><td>#{h(r.response)}</td></tr>"
    end

end
