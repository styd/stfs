Rails.application.routes.draw do
  root 'tweets#index'
  get 'tweets' => "tweets#index"
  get 'statuses' => "statuses#index"
  get '/auth/:provider/callback', to: 'fb_sessions#create'
  get '/auth/failure', to: redirect('/statuses')
  get 'statuses/signout', to: 'fb_sessions#destroy', as: 'signout'

  resources :fb_sessions, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
