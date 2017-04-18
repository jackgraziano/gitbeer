namespace :boring do
  desc "TODO"
  task reset: :environment do
    puts 'kill -9 $(lsof -i tcp:3000 -t)'
    puts `bundle install`
    puts `rails db:reset`
  end
end
