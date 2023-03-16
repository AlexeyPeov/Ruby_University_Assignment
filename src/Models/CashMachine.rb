class CashMachine
  def initialize(balance)
    @balance = balance
  end

  def deposit(value)
    if value.negative?
      "Deposit invalid: must be more than zero\n"
    elsif value > 300_000
      'Deposit invalid: 300,000 is the maximum deposit value'
    else
      @balance += value
      'Deposit successful!'
    end
  end

  def withdraw(value)
    if value.negative?
      "Withdrawal invalid: must be more than zero\n"
    elsif value > @balance
      'Withdrawal invalid: not enough funds'
    elsif value > 100_000
      'Withdrawal invalid: maximum withdrawal amount is 100000'
    else
      @balance -= value
      'Withdrawal successful!'
    end
  end

  def get_balance
    @balance
  end

end
