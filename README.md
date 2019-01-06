# Yabeda::Datadog

Adapter for easy exporting collected custom metrics from your application to the [Datadog](https://www.datadoghq.com/).


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'yabeda-datadog'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install yabeda-datadog

## Usage

1. Go to [API integration page](https://app.datadoghq.com/account/settings#api) and create API and APP keys.

2. Set keys in configure initializer

    ```ruby
    Yabeda.configure do
      self.datadog_api_key = ENV['datadog_api_key']
      self.datadog_app_key = ENV['datadog_app_key']
      self.host = 'production' # name of application
      ...
    end
    ```

3. All metrics registered in Yabeda will be sent to Datadog automatically.

4. On Datadog dashboard add new widget and customize metric output.
![Datadog dashboard widget](https://user-images.githubusercontent.com/30317561/50737637-f0af2c00-11dc-11e9-8910-97134cc0a77a.png)

```ruby
    Yabeda.configure do
      group :poll do
        
      end
      ...
    end
    ...
    
    Yabeda.poll.whistles_active.set({tags: 12}, 25)
       
```
You can filter metrics by host, device(group) and tags.
More detailed graph customization you could find [here](https://docs.datadoghq.com/graphing/).

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/yabeda-datadog. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Yabeda::Datadog project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/yabeda-datadog/blob/master/CODE_OF_CONDUCT.md).
