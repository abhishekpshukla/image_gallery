ActionController::Routing::Routes.draw do |map|
  map.resources :images
  map.view_by_bucket "/view_by_bucket/:id", :controller => "images", :action => "view_by_bucket"
  map.resources :search_images
  map.search_by_tag "/search_by_tag", :controller => "search_images", :action => "search_by_tag"
  map.search_by_bucket "/search_by_bucket", :controller => "search_images", :action => "search_by_bucket", :method => :get
  map.resource :account, :controller => "users"
  map.resources :users
  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"
end
