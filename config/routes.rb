Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/gardens', to: 'gardens#index'
  get 'gardens/new', to: 'gardens#new'
  get '/gardens/:id', to: 'gardens#show'

  get '/gardens/:id/plots', to: 'garden_plots#index'

  get '/plots', to: 'plots#index'
  get '/plots/:id', to: 'plots#show'

  get '/flower_shops',to: 'flower_shops#index'
  get '/flower_shops/:id', to: 'flower_shops#show'

  get '/flowers', to: 'flowers#index'
end
