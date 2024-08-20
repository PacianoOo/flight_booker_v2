class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :flight_number
      t.datetime :departure_time
      t.integer :flight_duration
      t.integer :departure_airport
      t.integer :arrival_airport
      t.timestamps
    end
  end
end
