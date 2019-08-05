Rails.application.routes.draw do
  get '/comics', to: 'comics#index'

  get '/comics/new', to: 'comics#new'

  post '/comics', to: 'comics#create'

  get '/comics/:id/edit', to: 'comics#edit'

  patch '/comics/:id', to: 'comics#update'

  delete '/comics/:id', to: 'comics#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
