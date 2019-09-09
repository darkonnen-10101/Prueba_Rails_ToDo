Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'todos', to: 'todos#index'
  get 'todos/new', to: 'todos#new'
  get 'todos/list', to: 'todos#list'
  get 'todos/:id', to: 'todos#show', as: 'todo'
  get 'todos/:id/edit', to: 'todos#edit'
  get 'todos/:id/complete', to: 'todos#complete', as: 'complete'

  post 'todos', to: 'todos#create'

  patch 'todos/:id', to: 'todos#update'

  delete 'todos/:id', to: 'todos#destroy'

  root "todos#index"

#  root 'todos#index'
end
