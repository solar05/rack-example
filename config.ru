class Application
  def call(env)
    status = 200
    headers = {"Content-Type" => "text/html"}
    body = ["Hello from rack app example! Current time is " + Time.new.strftime('%m/%d/%Y %H:%M %p')]
    [status, headers, body]
  end
end

run Application.new
