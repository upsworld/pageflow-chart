Pageflow::Chart::Engine.routes.draw do
  resources :scraped_sites, only: [:create, :show]
end
