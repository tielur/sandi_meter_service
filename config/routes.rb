Rails.application.routes.draw do

  root 'users#new'

  # omniauth
  get '/auth/:provider/callback', to: 'sessions#create' # Matches github callback url
  get "/signout" => "sessions#destroy", :as => :signout
end
