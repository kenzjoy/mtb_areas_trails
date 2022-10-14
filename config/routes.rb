Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/areas', to: 'areas#index'
  get '/areas/:id', to: 'areas#show'
  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'
  get '/areas/:area_id/trails', to: 'trails#show'
end
