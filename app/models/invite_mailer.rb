class InviteMailer < ActionMailer::Base

    def invite(rsvp, sent_at = Time.now)
        @subject    = "Invitation to #{rsvp.event.name} on #{rsvp.event.date}"
        @body[:rsvp] = rsvp
        @recipients = rsvp.person.email
        @from       = 'rails@dague.org'
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
