# frozen_string_literal: true

require "uri"

class PlaceMap
  BASE_URL = "https://www.google.com/maps/embed/v1/place"

  def self.create(options = {})
    unless options.key?(:q)
      raise ArgumentError "Maps API for a place requires a 'q' parameter for a map marker location"
    end

    api_key = [options[:api_key], GoogleMapsEmbed.configuration.dynamic_key,
               GoogleMapsEmbed.configuration.api_key].compact.first

    exclude_keys = %i[api_key width height frameborder style loading referrer_policy]

    filtered_options = options.reject { |key, _| exclude_keys.include?(key) }
    extra_url = filtered_options.map do |key, value|
      "#{key}=#{URI.encode_www_form_component(value)}"
    end.join("&").gsub("%2C", ",")

    src_url = "#{BASE_URL}?key=#{api_key}&#{extra_url}"

    GoogleMapsEmbed::IframeGenerator.generate(src_url, options)
  end
end
