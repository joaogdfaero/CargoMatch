class AddParticipantsToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :participants, :text
  end
end
