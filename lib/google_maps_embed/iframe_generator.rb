# frozen_string_literal: true

# # frozen_string_literal: true

module GoogleMapsEmbed
  module IframeGenerator
    def self.generate(src_url, options = {})
      ["<iframe",
       "width=\"#{options[:width] || "450"}\"",
       "height=\"#{options[:height] || "250"}\"",
       "frameborder=\"#{options[:frameborder] || "0"}\"",
       "style=\"#{options[:style] || "border:0"}\"",
       "loading=\"#{options[:loading] || "lazy"}\"",
       "referrerpolicy=\"#{options[:referrer_policy] || "no-referrer-when-downgrade"}\"",
       "src=\"#{src_url}\"",
       "allowfullscreen",
       ">",
       "</iframe>"].join(" ")
    end
  end
end
