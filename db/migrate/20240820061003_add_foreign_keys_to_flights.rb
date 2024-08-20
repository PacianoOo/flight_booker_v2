class AddForeignKeysToFlights < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :flights, :airports, column: :departure_airport
    add_foreign_key :flights, :airports, column: :arrival_airport
  end
end
