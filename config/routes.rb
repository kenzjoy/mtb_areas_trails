Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/areas', to: 'areas#index'
  get '/areas/new', to: 'areas#new' 
  post '/areas', to: 'areas#create'

  get '/areas/:id', to: 'areas#show'
  get '/areas/:id/edit', to: 'areas#edit'
  patch '/areas/:id', to: 'areas#update'
  
  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'
  
  get '/areas/:area_id/trails', to: 'area_trails#index'
end
