require_relative '../../models/level_2/rental'
require_relative '../../models/commission'

module Level3
  class Rental < Level2::Rental

    def output
      { id: id, price: price, commission: Commission.new(price, duration_in_days).output }
    end

  end
end