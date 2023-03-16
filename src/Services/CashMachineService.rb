
class CashMachineService

  def deposit(params)
    balance = params['balance'].to_i
    user_balance = (DB.find_by_id(params['id'])['balance']).to_i

    cash_machine = CashMachine.new(user_balance)
    message = cash_machine.deposit(balance)
    DB.update(params['id'], 'balance', cash_machine.get_balance)
    message
  end

  def withdraw(params)
    balance = params['balance'].to_i
    user_balance = (DB.find_by_id(params['id'])['balance']).to_i

    cash_machine = CashMachine.new(user_balance)
    message = cash_machine.withdraw(balance)
    DB.update(params['id'], 'balance', cash_machine.get_balance)
    message
  end

end
