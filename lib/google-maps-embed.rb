# frozen_string_literal: true

require_relative "google_maps_embed/version"
require_relative "google_maps_embed/configuration"
require_relative "google_maps_embed/static_map"

module GoogleMapsEmbed
  class Error < StandardError; end

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  def self.url(type: :static, **options)
    case type
    when :static
      StaticMap.url(options)
    else
      raise ArgumentError, "Unknown map type: #{type}"
    end
  end
end
