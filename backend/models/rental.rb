require 'date'

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