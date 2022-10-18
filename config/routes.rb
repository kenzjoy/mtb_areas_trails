Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/areas', to: 'areas#index'
  get '/areas/new', to: 'areas#new' 
  
  get '/areas/:id', to: 'areas#show'
  get '/areas/:id/edit', to: 'areas#edit'
  patch '/areas/:id', to: 'areas#update'
  post '/areas', to: 'areas#create'
  
  get '/trails', to: 'trails#index'
  get '/trails/:id', to: 'trails#show'

  get '/areas/:area_id/trails', to: 'area_trails#index'
  get '/areas/:area_id/trails/new', to: 'area_trails#new'
  post '/areas/:area_id/trails', to: 'area_trails#create'

  get '/trails/:id/edit', to: 'trails#edit'
  patch '/trails/:id', to: 'trails#update'

  
end
