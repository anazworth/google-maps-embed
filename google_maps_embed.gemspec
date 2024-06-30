# frozen_string_literal: true

require_relative "lib/google_maps_embed/version"

Gem::Specification.new do |spec|
  spec.name = "google-maps-embed"
  spec.version = GoogleMapsEmbed::VERSION
  spec.authors = ["Austin Nazworth"]
  spec.email = ["austin.nazworth@gmail.com"]

  spec.summary = "A Ruby gem that simplifies generating URLs for embedding static or dynamic Google Maps."
  spec.description = <<-DESC
    Google-Maps-Embed is a versatile Ruby gem designed to simplify the generation of Google Maps URLs
    for embedding static and dynamic maps in web applications. Designed with Rails in mind.

    Key features include:
    - Flexible Configuration: Define map parameters dynamically, including center coordinates, zoom levels, markers, and paths.
    - API Integration: Seamlessly integrates with Google Maps API to generate reliable map URLs.
    - URL Signing: Optionally signs URLs for secure API usage when configured with a secret key.
    - Customization: Easily customize map dimensions, marker styles, and path configurations.
    - Simplified Usage: Streamlined methods for constructing map URLs, ensuring compatibility and consistency.

    Ideal for web developers seeking efficient map integration solutions.
  DESC
  spec.homepage = "https://github.com/anazworth/google-maps-embed"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.0.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/anazworth/google-maps-embed/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
