class Ticket < ActiveRecord::Base
	has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
	belongs_to :user
	def phone
    	return nil
  	end
  	def self.import(file)
  	  CSV.foreach(file.path, headers: true) do |row|
    	Ward.create(:name => row['Name of the ULB'], :no_of_wards => row['Total No. of Wards'])
  	  end
	end
	def ward
		return nil
	end
end
