module Pageflow
  module Chart
    class Configuration
      attr_reader :scraper_options
      attr_accessor :paperclip_base_path
      attr_accessor :scraped_sites_root_url

      def initialize
        @scraper_options = {}
        @paperclip_base_path = ':host'
      end

      def paperclip_options(options = {})
        {
          path: File.join(paperclip_base_path, ":class/:id_partition/#{options.fetch(:basename, 'all')}.#{options.fetch(:extension)}")
        }
      end
    end
  end
end
