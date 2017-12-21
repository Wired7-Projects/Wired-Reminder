require_relative '../lib/sender.rb'

class SetReminder
    include Sidekiq::Worker
    include Sender
    def perform()
        puts "HERE"
        mail ENV['WIRED_REMINDER_MAIL_USER'], ENV['WIRED_REMINDER_MAIL_USER'], "Your Reminder", "This is a reminder"
    end
end
