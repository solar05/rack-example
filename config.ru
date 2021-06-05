class Application
  def call(env)
    inspect_env(env)
    method = env['REQUEST_METHOD']
    if method == 'GET'
      status = 200
      path = env['REQUEST_PATH']
      headers = {'Content-Type' => 'text/html'}
      body = ["Hello from rack app example! Requested path #{path} Current time is " + Time.new.strftime('%m/%d/%Y %H:%M %p')]
    else
      status = 405
      headers = {}
      body = ["Method not allowed: #{method}"]
    end

    [status, headers, body]
  end

  private
  def inspect_env(env)
    puts format('Request headers', request_headers(env))
    puts format('Server info', server_info(env))
    puts format('Rack info', rack_info(env))
  end

  def request_headers(env)
    env.select { |key, value| key.include?('HTTP_') }
  end

  def server_info(env)
    env.reject { |key, value| key.include?('HTTP_') or key.include?('rack.') }
  end

  def rack_info(env)
    env.select { |key, value| key.include?('rack.') }
  end

  def format(heading, pairs)
    [heading, "", format_pairs(pairs), "\n"].join("\n")
  end

  def format_pairs(pairs)
    pairs.map { |key, value| '  ' + [key, value.inspect].join(': ') }
  end
end

run Application.new
