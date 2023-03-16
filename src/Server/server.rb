# frozen_string_literal: true

require 'socket'
require 'rack'
require 'rack/utils'
require 'stringio'
class Server
  def initialize(app)
    @app = app
    @server = TCPServer.new('0.0.0.0', 3000)
  end

  def start
    while (connection = @server.accept)
      request = connection.gets
      method, full_path = request.split(' ')
      path, query = full_path.split('?')

      params = {}
      query&.split('&')&.each do |param|
          key, value = param.split('=')
          params[key] = value
      end


      headers = {}
      while (line = connection.gets) != "\r\n"
        key, value = line.split(': ')
        headers[key] = value.chomp
      end


      body = nil
      if headers['Content-Length'] && headers['Content-Length'].to_i > 0
        body = connection.read(headers['Content-Length'].to_i)
      end

      status, headers, body = @app.call({
                                          'REQUEST_METHOD' => method,
                                          'PATH_INFO' => path,
                                          'QUERY_STRING' => query,
                                          'rack.input' => StringIO.new(body || ''),
                                          'rack.request.query_hash' => params

                                        })

      connection.print("HTTP/1.1 #{status}\r\n")

      headers.each { |key, value| connection.print("#{key}: #{value}\r\n") }

      connection.print "\r\n"

      body.each { |part| connection.print(part) }

      connection.close
    end
  end
end
