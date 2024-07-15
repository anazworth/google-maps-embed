# frozen_string_literal: true

require "google_maps_embed"

module GoogleMapsEmbed
  class Railtie < Rails::Railtie
    initializer "google_maps_embed.view_helpers" do
      ActiveSupport.on_load(:action_view) do
        include GoogleMapsEmbed::ViewHelpers
      end
    end
  end
end
