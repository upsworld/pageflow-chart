module Pageflow
  module Chart
    class ScrapedSitesController < Chart::ApplicationController
      respond_to :json

      def create
        scraped_site = ScrapedSite.create!(scraped_site_params)
        scraped_site.process!

        respond_with(scraped_site)
      end

      def show
        scraped_site = ScrapedSite.find(params[:id])
        respond_with(scraped_site)
      end

      protected

      def scraped_site_params
        params.require(:scraped_site).permit(:url)
      end
    end
  end
end
