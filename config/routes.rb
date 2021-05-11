Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'welcome#index'

  get '/gardens', to: 'gardens#index'
  get '/gardens/:id', to: 'gardens#show'

  get '/plots', to: 'plots#index'
  get '/plots/:id', to: 'plots#show'
end
