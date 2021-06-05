class Application
  def call(env)
    method = env['REQUEST_METHOD']
    if method == 'GET'
      status = 200
      path = env['REQUEST_PATH']
      headers = {'Content-Type' => 'text/html'}
      body = ["Hello from rack app example! Requested path #{path} Current time is " + Time.new.strftime('%m/%d/%Y %H:%M %p')]
      return [status, headers, body]
    else
      status = 405
      body = ["Method not allowed: #{method}"]
      return [status, {}, body]
    end
  end
end

run Application.new
