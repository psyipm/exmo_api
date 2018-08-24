[![Build Status](https://semaphoreci.com/api/v1/igormalinovskiy/exmo_api/branches/master/shields_badge.svg)](https://semaphoreci.com/igormalinovskiy/exmo_api)
[![Code Climate](https://codeclimate.com/github/psyipm/exmo_api/badges/gpa.svg)](https://codeclimate.com/github/psyipm/exmo_api)
[![Gem Version](https://badge.fury.io/rb/exmo_api.svg)](https://badge.fury.io/rb/exmo_api)

# ExmoApi

This gem is a simple wrapper for Exmo.com exchange API. Please, refer to [official documentation](https://exmo.com/en/api) for detailed API methods description.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'exmo_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exmo_api

## Configuration

Configure your gem if you want to use private API methods:

```ruby
# config/initializers/exmo_api.rb

ExmoApi.setup do |config|
  config.api_key = 'your_api_key'
  config.api_secret = 'your_api_secret'
end
```

There is some additional configuration options available. These options are set by default:

```ruby
ExmoApi.setup do |config|
  # API endpoint can be changed via configuration
  #
  config.api_endpoint = 'https://api/exmo.com/v1'

  # Public methods list can also be changed
  #
  public_api_methods = [
    :trades,
    :order_book,
    :ticker,
    :pair_settings,
    :currency
  ]
end
```

## Usage

```ruby
  request = ExmoApi::Request.new(:ticker)

  request.perform
  {
    "BTC_USD"=>{
      "buy_price"=>"6559.79",
      "sell_price"=>"6569",
      "last_trade"=>"6559.79000001",
      "high"=>"6591.15652728",
      "low"=>"6414",
      "avg"=>"6508.36792358",
      "vol"=>"789.26528294",
      "vol_curr"=>"5177414.51040588",
      "updated"=>1535105637
    },
    #  ... truncated ...
  }
```

```ruby
  r = ExmoApi::Request.new(:currency)
  => #<ExmoApi::Request:0x00007f9af8814080 @api_method=:currency, @params={}>

  r.perform
  => ["USD", "EUR", "RUB", "PLN", "UAH", "BTC", "LTC", "DOGE", "DASH", "ETH", "WAVES", "ZEC", "USDT", "XMR", "XRP", "KICK", "ETC", "BCH", "BTG", "EOS", "HBZ", "BTCZ", "DXT", "STQ", "XLM", "MNX", "OMG", "TRX", "ADA", "INK"]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/exmo_api.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
