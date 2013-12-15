namespace :populate_data do
  desc "Populate tickets table with fake data"
  task tickets: :environment do
  	require "faker"
    user_ids = (1..100).to_a
    100.times do
      ticket = Ticket.new
      ticket.description = Faker::Lorem.sentence(rand(2..10)).chomp('.')
      ticket.resolved = [0,1].sample
      ticket.user_id = user_ids.sample
      ticket.category = ["Road","Sanitation","Health","Education"].sample
      ticket.created_at = Time.zone.now
      ticket.save!
    end

    Ticket.all.each { |ticket| ticket.picture = File.open(Dir.glob(File.join(Rails.root, 'sampleimages', '*')).sample); ticket.save! }
  end

end
