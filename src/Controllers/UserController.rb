require 'erb'
require 'rack'

class UserController

  def initialize(cashMachineService)
    @cashMachineService = cashMachineService
  end

  def index(params)
    @id = params['id']
    @id = 1 if @id.nil?
    @user = DB.find_by_id(@id)
    if @user.nil?
      template = File.read("#{__dir__}/../Views/404.html.erb")
    else
      template = File.read("#{__dir__}/../Views/index.html.erb")
    end
    erb = ERB.new(template)
    erb.result(binding)
  end

  def update(params)
    if params['action'] == "Deposit"
      @message = @cashMachineService.deposit(params)
    elsif params['action'] == "Withdraw"
      @message = @cashMachineService.withdraw(params)
    end
  end
end
