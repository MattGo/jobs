#!/usr/bin/env ruby

require 'json'
require 'date'

class Car < Struct.new(:id, :price_per_day, :price_per_km)
end

class Rental < Struct.new(:id, :car_id, :start_date, :end_date, :distance)
  attr_accessor :car

  def output
    { id: id, price: price }
  end

  private

  def price
    time_fare + distance_fare
  end

  def duration_in_days
    (Date.parse(end_date, '%Y-%m-%d') - Date.parse(start_date, '%Y-%m-%d') + 1).to_i
  end

  def time_fare
    duration_in_days * car.price_per_day
  end

  def distance_fare
    distance * car.price_per_km
  end
end

def file_to_json(filename)
  begin
    file = File.read("data/#{filename}")
    JSON.parse(file, { symbolize_names: true })
  rescue
    print "Failed to open #{filename}\n"
    exit
  end
end

def compute_rental_fares
  data_json = file_to_json('input.json')

  cars = data_json[:cars].map { |car_attrs|
    Car.new(*car_attrs.values_at(*Car.members))
  }

  _rentals = data_json[:rentals].map { |rental_attrs|
    rental     = Rental.new(*rental_attrs.values_at(*Rental.members))
    rental.car = cars.select { |c| c.id == rental.car_id }.first
    rental.output
  }
end

def write_output
  File.write('data/output.json', JSON.pretty_generate({ rentals: compute_rental_fares }))
end

def problem_solved?
  file_to_json('expected_output.json') == file_to_json('output.json')
end


###################################
#  Execute the level 1 challenge  #
###################################

write_output
puts problem_solved? ? "output file matches the expected one" : "You may have some issue in your output file"
