# frozen_string_literal: true

module GoogleMapsEmbed
  class Configuration
    attr_accessor :api_key, :secret_key, :static_key, :dynamic_key

    def initialize
      @api_key = nil
      @secret_key = nil
      @static_key = nil
      @dynamic_key = nil
    end
  end
end
