# frozen_string_literal: true

require "google_maps_embed"
require_relative "test_helper"

class TestGoogleMapsEmbed < Minitest::Test
  def setup
    @test_config = GoogleMapsEmbed.configuration
    GoogleMapsEmbed.configure do |config|
      config.static_key = "test_static_key"
      config.dynamic_key = "test_dynamic_key"
      config.api_key = nil
      config.secret_key = nil
    end
  end

  def teardown
    GoogleMapsEmbed.configuration = @original_config
  end

  def test_that_it_has_a_version_number
    refute_nil ::GoogleMapsEmbed::VERSION
  end

  def test_invalid_map
    assert_raises ArgumentError do
      google_maps_embed(type: :invalid, latitude: 40.714728, longitude: -73.998672, zoom: 12)
    end
  end

  def test_url_with_static_map
    url = google_maps_embed(type: :static, latitude: 40.714728, longitude: -73.998672, zoom: 12,
                            api_key: "test_api_key")
    assert_match(/center=40.714728,-73.998672/, url)
    assert_match(/zoom=12/, url)
    assert_match(/size=400x400/, url)
    assert_match(/key=test_api_key/, url)
  end

  def test_url_with_static_map_and_address
    url = google_maps_embed(type: :static, address: "New York, NY", zoom: 12, api_key: "test_api_key")
    assert_match(/center=New\+York,\+NY/, url)
    assert_match(/zoom=12/, url)
    assert_match(/size=400x400/, url)
    assert_match(/key=test_api_key/, url)
  end

  def test_generate_place_map_iframe
    map = google_maps_embed(type: :place, q: "New York, NY", center: "37.4218,-122.0840", zoom: 4, maptype: "roadmap",
                            width: 400, height: 400)
    assert_match(/q=New\+York,\+NY/, map)
    assert_match(/zoom=4/, map)
    assert_match(/width="400"/, map)
    assert_match(/height="400"/, map)
    assert_match(/^<iframe /, map)
    assert_match(%r{/iframe>$}, map)
  end
end
