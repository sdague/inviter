class InviteMailer < ActionMailer::Base

    def invite(rsvp, sent_at = Time.now)
        @subject    = "Invitation to #{rsvp.event.name} on #{rsvp.event.date}"
        @body[:rsvp] = rsvp
        @recipients = rsvp.person.email
        @from       = 'sean@dague.net'
        @sent_on    = sent_at
        @headers    = {}
    end
    
    def changed(rsvp, sent_at = Time.now)
        @subject    = "Updated profile infrmation for #{rsvp.event.name}"
        @body[:rsvp] = rsvp
        @recipients = rsvp.person.email
        @from       = 'sean@dague.net'
        @sent_on    = sent_at
        @headers    = {}
    end

    def remind(sent_at = Time.now)
        @subject    = 'InviteMailer#remind'
        @body       = {}
        @recipients = ''
        @from       = '' 
        @sent_on    = sent_at
        @headers    = {}
    end
end
