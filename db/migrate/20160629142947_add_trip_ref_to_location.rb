class AddTripRefToLocation < ActiveRecord::Migration[5.0]
  def change
    add_reference :locations, :trip, foreign_key: true
  end
end
