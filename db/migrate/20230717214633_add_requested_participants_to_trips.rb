class AddRequestedParticipantsToTrips < ActiveRecord::Migration[7.0]
  def change
    add_column :trips, :requested_participants, :text
  end
end
