class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.string :departure_location
      t.string :arrival_location
      t.date :departure_date
      t.date :arrival_date
      t.time :departure_time
      t.time :arrival_time
      t.integer :trip_type
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
