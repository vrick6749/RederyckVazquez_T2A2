Rails.application.routes.draw do

  get "/books", to: "books#index", as: "intro"
  post "/books", to: "books#create"
  get "/books/new", to: "books#new", as: "create_book"
  get "/books/:id", to: "books#show", as: "view"


 
  put "/books/:id", to: "books#update"
  delete "/books/:id", to: "books#destroy"
end
