#!/usr/bin/env ruby

# Utils
require '../utils/data'

# Models
require '../models/car'
require '../models/rental'

def compute_rental_fares
  data_json = GetAround.file_to_json('input.json')

  cars = data_json[:cars].map { |car_attrs|
    Car.new(*car_attrs.values_at(*Car.members))
  }

  _rentals = data_json[:rentals].map { |rental_attrs|
    rental     = Rental.new(*rental_attrs.values_at(*Rental.members))
    rental.car = cars.select { |c| c.id == rental.car_id }.first
    rental.output
  }
end


###################################
#  Execute the level 1 challenge  #
###################################

GetAround.write_output(compute_rental_fares)
puts GetAround.problem_solved_message
