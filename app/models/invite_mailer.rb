class InviteMailer < ActionMailer::Base

    headers = {
        "X-Mailer" => "InviteR (beta) by Sean Dague"
    }
    
    def invite(rsvp, user, sent_at = Time.now)
        @subject    = "Invitation to #{rsvp.event.name} on #{rsvp.event.date.strftime('%A %B %d')}"
        @body[:rsvp] = rsvp
        @recipients = rsvp.person.email
        @from       = user.email
        @sent_on    = sent_at
        @headers    = headers
    end
    
    def changed(rsvp, user, sent_at = Time.now)
        @subject    = "Updated profile infrmation for #{rsvp.event.name}"
        @body[:rsvp] = rsvp
        @recipients = rsvp.person.email
        @from       = user.email
        @sent_on    = sent_at
        @headers    = headers
    end

    def remind(rsvp, user, sent_at = Time.now)
        @subject    = "Reminder for #{rsvp.event.name} on #{rsvp.event.date.strftime('%A %B %d')}"
        @body[:rsvp] = rsvp
        @recipients = rsvp.person.email
        @from       = user.email
        @sent_on    = sent_at
        @headers    = headers
    end
end
