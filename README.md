# Fiva

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fiva'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fiva

## Usage

```ruby
require 'fiva'
require 'json'

Fiva::Logger.new
  .add_handler(Fiva::puts_handler(level: Fiva::DEBUG))
  .add_handler(Fiva::putsr_handler(level: Fiva::DEBUG, func: ->(msg) { msg.to_json }))
  .write(Fiva::DEBUG, 'Hello!', foo: 'bar')
  .debug('Debug', tv: Fiva::TextValue.new('Foo'))
  .io('A message', text: 'Hello, World!', payload: "foo\n  asdf")
  .info('Info')
  .important('Important')
  .warning('Warning')
  .error('Error')
  .fatal('Fatal')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/handicraftsman/fiva.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
