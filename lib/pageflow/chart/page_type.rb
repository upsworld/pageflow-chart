module Pageflow
  module Chart
    class PageType < Pageflow::PageType
      name 'chart'

      def view_helpers
        [ScrapedSitesHelper]
      end
    end
  end
end
