# frozen_string_literal: true

module Github
  module Pages
    module Unscramble
      class << self
        def unscramble(site)
          Jekyll.logger.debug "GitHub-Pages-Unscramble:", \
                              "reloading pre-ghpages configuration, " \
                              "unscrambling plugins_dir #{site.config["plugins_dir"]}"

          config = Jekyll.configuration
          site.config["plugins_dir"] = config["plugins_dir"]
          site.safe = config["safe"]
          site.config["safe"] = config["safe"]
          loadit(site)
        end

        private

        # rubocop:disable Metrics/AbcSize
        def loadit(site)
          Jekyll.logger.debug "GitHub-Pages-Unscramble:", \
                              "requiring plugins from #{site.config["plugins_dir"]}"

          manager = Jekyll::PluginManager.new(site)
          manager.conscientious_require

          Jekyll.logger.debug "GitHub-Pages-Unscramble:", \
                              "instantiating any newly discovered Generators and Converters"

          # handle Generators
          generators = site.generators.map(&:class)
          Jekyll::Generator.descendants.select { |g| !generators.include?(g) }.each do |g|
            site.generators << g.new(site.config)
            Jekyll.logger.debug "GitHub-Pages-Unscramble:", \
                                "instantiated Generator #{g}"
          end
          site.generators.sort!

          # handle Converters
          converters = site.converters.map(&:class)
          Jekyll::Converter.descendants.select { |c| !converters.include?(c) }.each do |c|
            site.converters << c.new(site.config)
            Jekyll.logger.debug "GitHub-Pages-Unscramble:", \
                                "instantiated Converter #{c}"
          end
          site.converters.sort!
        end
        # rubocop:enable Metrics/AbcSize
      end
    end
  end
end

# verify ghpages has been required, else do nothing
if defined?(GitHubPages::VERSION)
  Jekyll::Hooks.register :site, :after_init, :priority => :high do |site|
    Github::Pages::Unscramble.unscramble(site)
  end
end
