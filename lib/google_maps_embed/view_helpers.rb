# frozen_string_literal: true

module GoogleMapsEmbed
  module ViewHelpers
    def google_maps_embed(type: :static, **options)
      GoogleMapsEmbed.map(type: type, **options)
    end
  end
end
