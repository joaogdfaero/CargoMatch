class Trip < ApplicationRecord
  validates  :trip_type, inclusion: { in: ['Solicitada', 'Oferecida'], message: "Deve ser uma viagem solicita ou oferecida" }
  belongs_to :user

  def self.ransackable_associations(auth_object = nil)
    ["user"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["arrival_date", "arrival_location", "arrival_time", "created_at", "departure_date", "departure_location", "departure_time", "id", "trip_type", "updated_at", "user_id"]
  end
end
