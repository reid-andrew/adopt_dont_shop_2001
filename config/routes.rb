Rails.application.routes.draw do
  root 'welcome#index'
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  get '/shelters/:id/delete', to: 'shelters#destroy'
  post '/shelters/new_shelter', to: 'shelters#create'
  patch '/shelters/:id/edit', to: 'shelters#update'
end
