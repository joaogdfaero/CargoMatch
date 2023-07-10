class ChangeDataTypeForTripType < ActiveRecord::Migration[7.0]
  def up
    change_column :trips, :trip_type, :string
  end
  
  def down
    change_column :trips, :trip_type, :integer
  end
end



