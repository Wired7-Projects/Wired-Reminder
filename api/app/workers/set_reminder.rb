class SetReminder
    include Sidekiq::Worker
    def perform()
        puts "HERE"
    end
end
