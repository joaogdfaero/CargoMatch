class Trip < ApplicationRecord
  validates  :trip_type, inclusion: { in: [0, 1], message: "must be either 0 or 1" }
  belongs_to :user
end
