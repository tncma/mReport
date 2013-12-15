namespace :populate_data do
  desc "Populate tickets table with fake data"
  task tickets: :environment do
  	require "faker"
    Ticket.all.each { |ticket| 
      ticket.picture = URI.parse("http://4.bp.blogspot.com/-SKodABVP-Ws/TmLevXRm-UI/AAAAAAAAA1c/gtkuInPYjsI/s1600/162011025597.055475Tamilnadu_logo.jpg")
      ticket.picture_file_name == "tamilnadu.jpg"
      ticket.picture_content_type == "image/jpg"
      ticket.location = ["Chennai","Dindigul","Karur","Coimbatore"].sample
      ticket.user.phone = ["+919677973324","+918870711421"].sample 
      ticket.save
    }


  end

end
