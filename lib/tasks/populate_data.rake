namespace :populate_data do
  desc "Populate tickets table with fake data"
  task tickets: :environment do
  	require "faker"
    Ticket.all.each { |ticket| 
      ticket.picture = URI.parse("http://upload.wikimedia.org/wikipedia/commons/thumb/8/81/TamilNadu_Logo.svg/790px-TamilNadu_Logo.svg.png")
      ticket.picture_file_name == "tamilnadu.png"
      ticket.picture_content_type == "image/png"
      ticket.location = ["Chennai","Dindigul","Karur","Coimbatore"].sample
      ticket.user.phone = ["+919677973324","+918870711421"].sample 
      ticket.save!
    }
  end
end
