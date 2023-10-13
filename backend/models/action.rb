class Action < Struct.new(:who, :type, :amount)

  def output
    { who: who, type: type, amount: amount }
  end

end