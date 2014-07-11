# Pageflow Chart

Page type showing scraped svg diagramms from Datawrapper.

## Installation

Add this line to your application's Gemfile:

    # Gemfile
    gem 'pagflow-chart'

Mount the engine:

    # config/routes.rb
    mount Pageflow::Chart::Engine, :at => '/chart'

Register the page type:

    # config/initializers/pageflow.rb
    Pageflow.register_page_type(Pageflow::Chart::PageType.new)

Include javascript/stylesheets:

    # app/assets/javascripts/application.js
    //= require "pageflow/chart"

    # app/assets/javascripts/editor.js
    //= require "pageflow/chart/editorq"

    # app/assets/stylesheets/application.scss.css
    @import "pageflow/chart"

Install and run migrations:

    rake pageflow_chart:install:migrations
    rake db:migrate SCOPE=pageflow_chart
