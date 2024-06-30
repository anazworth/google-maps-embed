require "rails/generators"

module GoogleMapsEmbed
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      desc "Creates a GoogleMapsEmbed initializer in your Rails application."

      def copy_initializer
        template "google_maps_embed.rb", "config/initializers/google_maps_embed.rb"
      end
    end
  end
end
