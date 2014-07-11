module Pageflow
  module Chart
    module ScrapedSitesHelper
      def scraped_site_url(scraped_site_id)
        scraped_site = ScrapedSite.find_by_id(scraped_site_id)

        if scraped_site
          scraped_site.html_file_url
        end
      end
    end
  end
end
