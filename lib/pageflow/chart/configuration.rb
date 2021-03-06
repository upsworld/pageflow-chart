module Pageflow
  module Chart
    class Configuration
      # Options to pass to Scraper when it is created in ScrapedSiteJob
      attr_reader :scraper_options

      # paperclip_base_path is a prefix for the paperclip options path
      attr_accessor :paperclip_base_path

      # If present scraped_sites_root_url replaces the host/domain-name of the
      # URL paperclip returns for the scraped HTML file.
      #
      # This can be used to circumvent the same-domain policy by setting it
      # to ie "/datawrapper" and redirecting from there to the S3 host alias that holds
      # the files.
      attr_accessor :scraped_sites_root_url

      # Default options for paperclip attachments which are supposed to
      # use s3 storage. All options allowed in paperclip has_attached_file
      # calls are allowed.
      # This defaults to the configuration in `config/initializers/pageflow.rb` by the same name.
      #
      # @param [Hash] opts
      # @option opts [Array<Regexp>] :head_script_blacklist Script tags in page head are ignored if they match any of this list of regexes.
      # @option opts [Array<Regexp>] :inline_script_blacklist Inline script tags are ignored if they match any of this list of regexes.
      # @option opts [Array<String>] :selector_blacklist HTML-elements matched by selectors in this list will not be scraped.
      # @return [Hash]
      attr_accessor :paperclip_s3_default_options

      # White list of URL prefixes (including protocol) of scraped
      # sites.
      # @return [Array<String>]
      attr_reader :supported_hosts

      def initialize
        @scraper_options = {
          head_script_blacklist: [/piwik/],
          inline_script_blacklist: [/piwik/],
          selector_blacklist: ['body .noscript']
        }
        @paperclip_s3_default_options = {}
        @paperclip_base_path = ':host'
        @scraped_sites_root_url = nil
        @supported_hosts = ['http://cf.datawrapper.de']
      end

      # @api private
      def paperclip_options(options = {})
        Pageflow.config.paperclip_s3_default_options
          .deep_merge(default_paperclip_path_options(options))
          .deep_merge(paperclip_s3_default_options)
      end

      private

      def default_paperclip_path_options(options)
        {
          path: File.join(paperclip_base_path, ":class/:id_partition/#{options.fetch(:basename, 'all')}.#{options.fetch(:extension)}")
        }
      end
    end
  end
end
