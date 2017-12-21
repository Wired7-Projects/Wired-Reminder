require 'sinatra'
require 'sidekiq'

require_relative './workers/set_reminder.rb'

Sidekiq.configure_server do |config|
    config.redis = { url: 'redis://redis:6379/0' }
end

Sidekiq.configure_client do |config|
    config.redis = { url: 'redis://redis:6379/0' }
end

get '/:seconds' do
    SetReminder.perform_at(Time.now.utc + params[:seconds].to_i)
end
