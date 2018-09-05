# Github::Pages::Unscramble 

`github-pages-unscramble` is a simple Jekyll plugin that runs alongside the `github-pages` plugin to undo the changes that plugin makes to a site's original `plugin_dir` and `safe` configuration settings and load any file-based plugins in `plugins_dir`. It also loads any plugins specified in the site's `_config.yml` that would otherwise be ignored due to the `github-pages` whitelist filter.

For reference, the Jekyll `github-pages` gem reconfigures a Jekyll site at runtime, setting `plugins_dir` to a random string and `safe` to `true`, and as a result, local file-based plugins do not load. If you are not using `github-pages` or do not wish to run file-based plugins or non-whitelisted plugins, you do not need `github-pages-unscramble`.

Note: `github-pages-unscramble` is intended to facilitate local plugin development and execution in a local GitHub Pages configured environment. It does not enable non-whitelisted plugins or file-based plugins to run directly on GitHub Pages.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'github-pages-unscramble', group: :jekyll-plugins
```

And then execute:

```
    $ bundle
```

NOTE: this gem must be included in the `jekyll-plugins` group to function.

## Usage

No additional action is required by the user after installation. The plugin will automatically run upon site initialization, and will restore the site's original `plugin_dir` and `safe` settings and subsequently load any newly discovered file-based plugins. Note that these are runtime changes only, as with the `github-pages` gem, and no configuration changes are made persistent. Please note that because this plugin is simply restoring pre-`github-pages` settings, if your site is already hard configured with `safe` on, it will continue to retain that value, and no custom plugins will be loaded.

## Debugging

`github-pages-unscramble` will report on the actions it is taking if you add `--verbose` to the end of your `bundle exec jekyll` command.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jamesluberda/github-pages-unscramble. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Github::Pages::Unscramble project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jamesluberda/github-pages-unscramble/blob/master/CODE_OF_CONDUCT.md).
