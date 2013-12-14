module ApplicationHelper
	Ticket::CATEGORIES = ["Road","Sanitation","Education"]

  # def resource_name
  #   :admin
  # end

  # def resource
  #   @resource ||= Admin.new
  # end

  # def devise_mapping
  #   @devise_mapping ||= Devise.mappings[:admin]
  # end

  def after_sign_in_path_for(resource)
  	puts "*"*100
  	puts "here"
  	tickets_path
  end
end
