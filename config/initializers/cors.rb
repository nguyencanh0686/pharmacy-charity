Rails.application.config.middleware.insert_before 0, Rack::Cors, debug: true, logger: (-> { Rails.logger }) do
  allow do
    origins *ENV['ALLOW_CORS_DOMAIN'].split(',')
    resource '/cors',
      :headers => :any,
      :methods => [:post]

    resource '*',
      :headers => :any,
      :methods => [:get, :post, :delete, :put, :patch, :options, :head],
      :credentials => true
  end
end
