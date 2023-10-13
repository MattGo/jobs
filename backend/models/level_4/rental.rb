require_relative '../../models/level_2/rental'
require_relative '../../models/commission'

module Level4
  class Rental < Level2::Rental

    def output
      { id: id, actions: actions }
    end

    private

    def actions
      commission = Commission.new(price, duration_in_days)
      [
        Action.new('driver', 'debit', price).output,
        Action.new('owner', 'credit', commission.owner_revenue).output,
        Action.new('insurance', 'credit', commission.insurance_fee).output,
        Action.new('assistance', 'credit', commission.assistance_fee).output,
        Action.new('drivy', 'credit', commission.drivy_fee).output
      ]
    end

  end
end