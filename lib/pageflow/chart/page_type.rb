module Pageflow
  module Chart
    class PageType < Pageflow::PageType
      name 'chart'

      def view_helpers
        [ScrapedSitesHelper]
      end

      def json_seed_template
        'pageflow/chart/page_type.json.jbuilder'
      end
    end
  end
end
