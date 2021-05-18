Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/gardens', to: 'gardens#index'
  get '/gardens/new', to: 'gardens#new'
  get '/gardens/:id', to: 'gardens#show'
  post '/gardens', to: 'gardens#create'
  get '/gardens/:id/edit', to: 'gardens#edit'
  patch '/gardens/:id', to: 'gardens#update'
  delete '/gardens/:id', to: 'gardens#destroy'

  get '/gardens/:id/plots', to: 'garden_plots#index'
  get '/gardens/:id/plots/new', to: 'garden_plots#new'
  post '/gardens/:id/plots', to: 'garden_plots#create'

  get '/plots', to: 'plots#index'
  get '/plots/:id', to: 'plots#show'
  get '/plots/:id/edit', to: 'plots#edit'
  patch '/plots/:id', to: 'plots#update'
  delete '/plots/:id', to: 'plots#destroy'

  get '/flower_shops',to: 'flower_shops#index'
  get '/flower_shops/new', to: 'flower_shops#new'
  get '/flower_shops/:id', to: 'flower_shops#show'
  post '/flower_shops', to: 'flower_shops#create'
  get '/flower_shops/:id/edit', to: 'flower_shops#edit'
  patch '/flower_shops/:id', to: 'flower_shops#update'


  get '/flower_shops/:id/flowers', to: 'flower_shop_flowers#index'
  get '/flower_shops/:id/flowers/new', to: 'flower_shop_flowers#new'
  post '/flower_shops/:id/flowers', to: 'flower_shop_flowers#create'

  get '/flowers', to: 'flowers#index'
  get '/flowers/:id', to: 'flowers#show'
  get '/flowers/:id/edit', to: 'flowers#edit'
  patch '/flowers/:id', to: 'flowers#update'
end
