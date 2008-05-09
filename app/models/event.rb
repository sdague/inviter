class Event < ActiveRecord::Base
    has_many :rsvps
    belongs_to :location
    belongs_to :user
    
    def yes_list
        list_by_state("yes")
    end

    def no_list
        list_by_state("no")
    end
    
    def maybe_list
        list_by_state("maybe")
    end
    
    def na_list
        list_by_state("na")
    end

    def yes_number
        number_by_state("yes")
    end

    def no_number
        number_by_state("no")
    end
    
    def maybe_number
        number_by_state("maybe")
    end
    
    def na_number
        number_by_state("na")
    end
    
    def number_by_state(state)
        rs = rsvps.find(:all, :conditions => ["state = ?", state])
        count = 0
        rs.each do |r|
            count += (r.num or 1)
        end
        return count
    end
    
    def list_by_state(state)
        if state == "na"
            return rsvps.find(:all, :conditions => ["state = ?", state]).sort_by {|s| s.person.email }
        else
            return rsvps.find(:all, :conditions => ["state = ?", state]).sort_by {|s| s.updated_at }
        end
    end 

end
