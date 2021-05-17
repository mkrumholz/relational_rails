Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/gardens', to: 'gardens#index'
  get '/gardens/new', to: 'gardens#new'
  get '/gardens/:id', to: 'gardens#show'
  post '/gardens', to: 'gardens#create'
  get '/gardens/:id/edit', to: 'gardens#edit'
  patch '/gardens/:id', to: 'gardens#update'

  get '/gardens/:id/plots', to: 'garden_plots#index'
  get '/gardens/:id/plots/new', to: 'garden_plots#new'
  post 'gardens/:id/plots', to: 'garden_plots#create'

  get '/plots', to: 'plots#index'
  get '/plots/:id', to: 'plots#show'
  get '/plots/:id/edit', to: 'plots#edit'
  patch '/plots/:id', to: 'plots#update'

  get '/flower_shops',to: 'flower_shops#index'
  get '/flower_shops/:id', to: 'flower_shops#show'

  get '/flower_shops/:id/flowers', to: 'flower_shop_flowers#index'

  get '/flowers', to: 'flowers#index'
  get '/flowers', to: 'flowers#index'
  get '/flowers/:id', to: 'flowers#show'
end
