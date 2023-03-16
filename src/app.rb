# frozen_string_literal: true

require_relative '../src/Controllers/UserController'
require_relative '../src/Services/CashMachineService'
require_relative '../src/Helpers/DB'
require_relative '../src/Models/CashMachine'

include DB
class App

  def init
    @cash_machine_service = CashMachineService.new
    @user_controller = UserController.new(@cash_machine_service)
  end

  def call(env)
    req = Rack::Request.new(env)
    case req.path
    when '/'
      response = @user_controller.index(req.params)
      [200, { 'Content-Type' => 'text/html' }, [response]]
    when '/update'
      if req.post?
        params = req.params
        @user_controller.update(params)
      end
      [302, { 'Location' => "/?id=#{req.params['id']}", 'Content-Type' => 'text/html' }, []]
    else
      [404, { 'Content-Type' => 'text/html' }, ['Not found']]
    end
  end
end
