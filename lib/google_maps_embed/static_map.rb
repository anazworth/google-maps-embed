# frozen_string_literal: true

require "uri"
require_relative "url_signer"

# This module provides functionality to generate URLs for Google Maps Static API.
# It supports specifying map parameters like center (latitude/longitude or address),
# zoom level, markers, paths, and various other options.
#
# The primary method, `GoogleMapsEmbed::StaticMap.url`, constructs the URL with
# the provided options and includes the necessary API key. If a secret key is configured,
# it will sign the URL to ensure secure usage of the API.
# module GoogleMapsEmbed
class StaticMap
  def self.url(options = {})
    unless (options.key?(:latitude) && options.key?(:longitude) && options.key?(:zoom)) ||
           (options.key?(:address) && options.key?(:zoom)) ||
           options.key?(:markers) ||
           options.key?(:path)
      raise ArgumentError, "Maps Static API requires 'center' and 'zoom' parameters if 'markers' not present"
    end

    coords = options.key?(:latitude) && options.key?(:longitude) ? "#{options[:latitude]},#{options[:longitude]}" : ""
    center = if coords.empty? && options.key?(:address)
               "center=#{URI.encode_www_form_component(options[:address])}"
             else
               "center=#{coords}"
             end

    api_key = [options[:api_key], GoogleMapsEmbed.configuration.static_key,
               GoogleMapsEmbed.configuration.api_key].compact.first

    required_options = {
      width: 400,
      height: 400
    }

    options = options.merge(required_options)

    base = "https://maps.googleapis.com/maps/api/staticmap?"

    base_url = [base,
                center,
                "size=#{options[:width]}x#{options[:height]}",
                "zoom=#{options[:zoom]}"]
               .reject(&:empty?).join("&").gsub("%2C", ",")

    markers_url = options.key?(:markers) ? parse_options(options[:markers], "markers") : ""
    path_url = options.key?(:path) ? parse_options(options[:path], "path") : ""

    exclude_keys = %i[latitute longitude address zoom path api_key width height markers]

    extra_options = options.reject { |key, _| exclude_keys.include?(key) }
    extra_url = extra_options.map do |key, value|
      "#{key}=#{URI.encode_www_form_component(value)}"
    end.join("&").gsub("%2C", ",")

    api_url = "key=#{api_key}"
    url = [base_url, markers_url, path_url, extra_url, api_url].reject(&:empty?).join("&")

    if GoogleMapsEmbed.configuration.secret_key
      UrlSigner.sign(url, GoogleMapsEmbed.configuration.secret_key)
    else
      url
    end
  end

  def self.parse_options(options, option_type)
    raise ArgumentError, "Markers should be given as an array of objects." unless options.is_a?(Array)

    options_url = []

    options.each do |option|
      current = []
      option.each do |k, v|
        current << "#{k}:#{URI.encode_www_form_component(v)}" if v.is_a? String
        current << URI.encode_www_form_component(v.join("|")) if v.is_a? Array
      end
      options_url << ("#{option_type}=" + current.join("%7C"))
    end

    options_url.join("&").gsub("%2C", ",")
  end
end
