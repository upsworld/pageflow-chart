pageflow.chart.ScrapedUrlInputView = pageflow.UrlInputView.extend({
  template: 'pageflow/chart/editor/templates/url_input',

  regions: {
    statusContainer: '.status_container'
  },

  onLoad: function() {
    this.listenTo(this.model, 'change:' + this.options.propertyName, function() {
      this.updateScrapingStatus();
    });

    this.updateScrapingStatus();
  },

  transformPropertyValue: function(url) {
    return $.Deferred(function(deferred) {
      pageflow.chart.scrapedSites.create(
        {
          url: url
        },
        {
          success: function(scrapedSite) {
            deferred.resolve(scrapedSite.id);
          }
        }
      );
    }).promise();
  },

  updateScrapingStatus: function() {
    var scrapedSite = this.getScrapedSite();

    if (scrapedSite) {
      this.statusContainer.show(new pageflow.chart.ScrapedSiteStatusView({
        model: scrapedSite
      }));
    }
    else {
      this.statusContainer.close();
    }
  },

  getScrapedSite: function() {
    if (this.model.has(this.options.propertyName)) {
      return pageflow.chart.scrapedSites.getOrFetch(this.model.get(this.options.propertyName));
    }
  }
});