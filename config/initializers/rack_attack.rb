limit_proc  = proc { |req| req.path.start_with?('/cms_admin/login') ? 30 : 300 }

Rack::Attack.throttle("requests by ip", limit: limit_proc, period: 5.minutes) do |request|
  request.ip
end
