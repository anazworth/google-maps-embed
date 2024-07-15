# Google_Maps_Embed

[![Gem Version](https://badge.fury.io/rb/google_maps_embed.svg)](https://badge.fury.io/rb/google_maps_embed)

## Currently a Work in Progress

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add google_maps_embed

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install google_maps_embed

## Usage

### Rails

#### Setup

1. Initialize the Rails configuration by running the command `rails g google_maps_embed:install` in the directory of your rails application.

2. Add your Google Maps API keys to the configuration file `config/initializers/google_maps_embed.rb`

#### Static Map

Creating a Static Map will generate a URL. This can be used in the `src=...` for an image tag or as a link to download.

```
google_maps_embed(type: :static, address: "orlando, florida", zoom: 1)
```

#### Dynamic Embedded Maps

Creating a Dynamic Map will generate an iframe. These can be used in .erb files.

```
<%= google_maps_embed(type: :place,
  q: "Orlando, FL",
  width: "fit",
  height: "450",
  zoom: 17) %>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/anazworth/google_maps_embed. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/anazworth/google_maps_embed/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Google_Maps_Embed project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/anazworth/google_maps_embed/blob/master/CODE_OF_CONDUCT.md).
