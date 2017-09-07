Rails.application.routes.draw do
  root to:"todo_items#index"
  # get 'todo_items/index'

  # get 'todo_items/show'

  # get 'todo_items/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :todo_items

end

# Jareds-MacBook-Pro:todo jared$ rake routes
# Prefix Verb   URI Pattern              Controller#Action
# todo_index GET    /todo(.:format)          todo#index
#        POST   /todo(.:format)          todo#create
# new_todo GET    /todo/new(.:format)      todo#new
# edit_todo GET    /todo/:id/edit(.:format) todo#edit
#   todo GET    /todo/:id(.:format)      todo#show
#        PATCH  /todo/:id(.:format)      todo#update
#        PUT    /todo/:id(.:format)      todo#update
#        DELETE /todo/:id(.:format)      todo#destroy