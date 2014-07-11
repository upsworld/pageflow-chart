require 'spec_helper'

module Pageflow::Chart
  describe ScrapedSite do
    describe '#csv_url' do
      it 'replaces base filename of url with data.csv' do
        scraped_site = ScrapedSite.new(url: 'http://example.com/foo/index.html')

        expect(scraped_site.csv_url).to eq('http://example.com/foo/data.csv')
      end

      it 'appends data.csv to directory url' do
        scraped_site = ScrapedSite.new(url: 'http://example.com/foo/')

        expect(scraped_site.csv_url).to eq('http://example.com/foo/data.csv')
      end
    end
  end
end
