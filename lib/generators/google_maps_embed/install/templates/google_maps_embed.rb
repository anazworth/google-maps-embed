# frozen_string_literal: true

GoogleMapsEmbed.configure do |config|
  config.api_key = "YOUR_GOOGLE_MAPS_API_KEY"

  # Optional, but recommended for generating static maps.
  # config.secret_key = "YOUR_GOOGLE_MAPS_SECRET_KEY"

  # Optional, but recommended for protecting keys.
  # Using a static or dynamic_key will overide the config.api_key variable for
  # that map type.
  # Using an API key as an optional argument will override any variable in this
  # configuration.
  # config.static_key = "YOUR_KEY_FOR_STATIC_MAPS"
  # config.dynamic_key = "YOUR_KEY_FOR_DYNAMIC_MAPS"
end
