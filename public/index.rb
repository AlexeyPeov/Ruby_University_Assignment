# frozen_string_literal: true

require_relative '../src/app'
require_relative '../src/Server/server'

app = App.new
app.init

server = Server.new(app)
server.start
