json.extract! user, :id, :name, :password, :nausea, :happiness, :tickets, :admin, :created_at, :updated_at
json.url user_url(user, format: :json)
