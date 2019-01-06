# IPFS Public Gateway Checker

This's a Golang version which migrates from:

* [public-gateway-checker](https://github.com/ipfs/public-gateway-checker) An online webpage of JS version
* [ipfg](https://github.com/JayBrown/Tools/tree/master/ipfg)  A shell cli version
* [ipfg(Golang)](https://github.com/gingerhot/ipfg)  A Golang version

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ipfs_public_gateway_checker'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ipfs_public_gateway_checker

## Usage

After installation, there will be a command `ipfg` available for you.

```bash
ipfg        # to get one available gateway url for you
ipfg all    # get all available gateway urls
ipfg help   # show help message
```
And you can require the gem in your code, just as what I do in the [bin/ipfg](./bin/ipfg).
There're two methods for you: `get()` and `active_list()`.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/beijingrb/ipfs_public_gateway_checker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the IpfsPublicGatewayChecker project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/beijingrb/ipfs_public_gateway_checker/blob/master/CODE_OF_CONDUCT.md).
