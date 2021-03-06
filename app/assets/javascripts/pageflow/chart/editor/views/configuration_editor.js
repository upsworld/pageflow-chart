pageflow.ConfigurationEditorView.register('chart', {
  configure: function() {
    var supportedHosts = this.options.pageType.supportedHosts;

    this.tab('general', function() {
      this.group('general');
    });

    this.tab('files', function() {
      this.input('scraped_site_id', pageflow.chart.ScrapedUrlInputView, {
        supportedHosts: supportedHosts,
        displayPropertyName: 'display_scraped_site_url',
        required: true
      });
      this.input('background_image_id', pageflow.FileInputView, {collection: pageflow.imageFiles});
      this.input('thumbnail_image_id', pageflow.FileInputView, {
        collection: pageflow.imageFiles,
        imagePositioning: false
      });
    });

    this.tab('options', function() {
      this.group('options');
    });
  }
});