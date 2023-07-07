json.extract! trip, :id, :departure_location, :arrival_location, :departure_date, :arrival_date, :departure_time, :arrival_time, :trip_type, :user_id, :created_at, :updated_at
json.url trip_url(trip, format: :json)
