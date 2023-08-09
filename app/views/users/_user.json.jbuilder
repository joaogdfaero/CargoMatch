json.extract! user, :id, :name, :cpf, :driver, :created_at, :updated_at
json.url user_url(user, format: :json)
