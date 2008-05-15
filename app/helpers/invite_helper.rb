module InviteHelper

    def address(location)
        return "#{location.name}<br/>#{location.address}<br/>#{location.city}, #{location.state} #{location.zip}<br/>#{location.phone}"
        
    end
    
    def format_invitee_admin(r)
        date = ""
        if r.visited_at
            date = r.visited_at.strftime("%a, %b %d - %H:%M")
        end

        uninvite = "Uninviting #{r.person.email}.  Are you sure?"
        html = "<tr valign='top'><td>#{h(r.person.name)} &lt;#{h(r.person.email)}&gt;</td>"
        html += "<td><i>#{date}</i></td><td>#{r.num or 1}</td>"
        html += "<td>#{h(r.response)}</td><td>#{link_to 'Remove', r, :confirm => uninvite, :method => :delete}</td></tr>"
        return html
    end

    
    def format_invitee(r)
        name = r.person.name
        if (not name) or (name.length < 1)
            name = r.person.email.sub(/@.*/, "")
        end
        return "<tr valign='top'><td>#{h(name)}</td><td>#{r.num or 1}</td><td>#{h(r.response)}</td></tr>"
    end

end
