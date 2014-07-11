pageflow.chart.ScrapedSiteStatusView = Backbone.Marionette.ItemView.extend({
  template: 'pageflow/chart/editor/templates/scraped_site_status',
  className: 'scraped_site_status',

  modelEvents: {
    change: 'update'
  },

  onRender: function() {
    this.update();
  },

  update: function() {
    this.$el.toggleClass('processed', this.model.isProcessed());
    this.$el.toggleClass('failed', this.model.isFailed());
    this.$el.toggleClass('processing', this.model.isProcessing());
  }
});