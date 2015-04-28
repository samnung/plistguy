# plistguy

plistguy is wrapper around PlistBuddy to support shell pipes as input so now you can write `cat some.plist | plistguy -c "Print :0"` and it works as you would expect.

[![Build Status](http://img.shields.io/travis/samnung/rb-mac_shortcuts/master.svg?style=flat)](https://travis-ci.org/samnung/rb-mac_shortcuts)
[![Gem Version](http://img.shields.io/gem/v/mac_shortcuts.svg?style=flat)](http://badge.fury.io/rb/mac_shortcuts)

## Installation

Run this command:

```ruby
[sudo] gem install plistguy
```


## Usage

Tool should support same commands as PlistBuddy, but path to file is optional.

Examples:

```shell
plistguy -c "Print :CFBundleIdentifier" /Applications/Calculator.app/Contents/Info.plist
```

or 

```shell
plistguy -c "Print :CFBundleIdentifier" < /Applications/Calculator.app/Contents/Info.plist
```

or

```shell
cat /Applications/Calculator.app/Contents/Info.plist | plistguy -c "Print :CFBundleIdentifier"
```

Result is always looks like this: `com.apple.calculator`


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/samnung/plistguy/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
