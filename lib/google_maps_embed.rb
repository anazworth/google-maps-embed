# frozen_string_literal: true

require_relative "google_maps_embed/version"
require_relative "google_maps_embed/configuration"
require_relative "google_maps_embed/static_map"
require_relative "google_maps_embed/place_map"
require_relative "google_maps_embed/iframe_generator"
require "google_maps_embed/railtie" if defined?(Rails)

module GoogleMapsEmbed
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.map(type: :static, **options)
    case type
    when :static
      StaticMap.url(options)
    when :place
      PlaceMap.create(options)
    else
      raise ArgumentError, "Unknown map type: #{type}"
    end
  end
end

def google_maps_embed(type: :static, **options)
  GoogleMapsEmbed.map(type: type, **options)
end
