class Commission

  def initialize(total_price, duration_in_days)
    @total_price      = total_price
    @duration_in_days = duration_in_days
    @total_commission = (total_price * 0.3).to_i
  end

  def output
    { insurance_fee: insurance_fee, assistance_fee: assistance_fee, drivy_fee: drivy_fee }
  end

  private

  def insurance_fee
    @total_commission / 2
  end

  def assistance_fee
    @duration_in_days * 100
  end

  def drivy_fee
    (@total_commission / 2) - assistance_fee
  end

end