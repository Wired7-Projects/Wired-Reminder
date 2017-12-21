require 'pony'

module Sender
    def mail to, from, subject, body
        Pony.mail({
            :to => to,
            :from => from,
            :subject => subject,
            :body => body,
            :via => :smtp,
            :via_options => {
            :address              => ENV['WIRED_REMINDER_MAIL_ADDRESS'],
            :port                 => ENV['WIRED_REMINDER_MAIL_PORT'],
            :enable_starttls_auto => true,
            :user_name            => ENV['WIRED_REMINDER_MAIL_USER'],
            :password             => ENV['WIRED_REMINDER_MAIL_PASSWORD'],
            :authentication       => :plain,
            :domain               => ENV['WIRED_REMINDER_MAIL_DOMAIN']
        }
        })
    end
end
