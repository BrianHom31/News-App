Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root    "welcome#home", as: "home_page"

  # 7 deadly routes
  #index
  get     "/users"           =>    "users#index", as: "users"
  #sign up:
  get     "/signup"            =>  "users#new", as: "new_user"
  post    "/users"           =>    "users#create"
  get     "/users/:id"       =>    "users#show", as: "user"
  get     "/users/:id/edit"  =>    "users#edit", as: "edit_user"
  put     "/users/:id"       =>    "users#update"
  patch   "/users/:id"       =>    "users#update"
  delete  "/users/:id"       =>    "users#destroy"

  # # login
  # get     "/login"              =>  "users#login_form"
  # post    "/login"              =>  "users#create_login"
  #
  # # logout
  # get     "/logout"             =>  "users#logout"

resources :newsfeeds

end
