Rails.application.routes.draw do

  mount Pageflow::Chart::Engine => "/charts"
end
