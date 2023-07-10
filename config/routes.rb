Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "welcome#index"

  get "/orchestras", to: "orchestras#index"
  get "/orchestras/new", to: "orchestras#new"
  post "/orchestras", to: "orchestras#create"
  get "/orchestras/:id", to: "orchestras#info"
  get "/musicians", to: "musicians#index"
  get "/musicians/:id", to: "musicians#info"
  get "orchestras/:id/musicians", to: "orchestras#tables"

end
