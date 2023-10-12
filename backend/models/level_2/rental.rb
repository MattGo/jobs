require_relative '../rental'

module Level2
  class Rental < ::Rental

    private

    def discount(day)
      case
      when day <= 1
        0
      when day <= 4
        0.1
      when day <= 10
        0.3
      else
        0.5
      end
    end

    def time_fare
      (1..duration_in_days).sum do |day|
        (car.price_per_day - car.price_per_day * discount(day)).to_i
      end
    end

  end
end