class Booking < ApplicationRecord
    belongs_to :flight
    accepts_nested_attributes_for :passengers, allow_destroy: true
end
