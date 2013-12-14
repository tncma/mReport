json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :description, :subject, :category, :user_id
  json.url ticket_url(ticket, format: :json)
end
