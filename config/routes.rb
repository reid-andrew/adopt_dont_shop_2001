Rails.application.routes.draw do
  root 'welcome#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/pets', to: 'shelters#showpets'
  get '/shelters/:id/edit', to: 'shelters#edit'
  get '/shelters/:id/delete', to: 'shelters#destroy'
  get '/pets', to: 'pets#index'
  post '/shelters/new_shelter', to: 'shelters#create'
  patch '/shelters/:id/edit', to: 'shelters#update'
end
