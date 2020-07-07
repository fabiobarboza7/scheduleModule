Apipie.configure do |config|
  config.app_name                = "CarenApi"
  config.api_base_url            = ""
  config.doc_base_url            = "/api/v1/docs"
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end
