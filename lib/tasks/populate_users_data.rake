namespace :populate_users_data do
  desc "Populate Users table with fake data"
  task users: :environment do
  	require "faker"
    100.times do
      user = User.new
      user.phone = Faker::PhoneNumber.phone_number
      user.created_at = Time.now
      user.save!
    end
  end

end
