Rails.application.routes.draw do
  devise_for :users
  get "/", to: "pages#home", as: "root"
  get "/books", to: "books#index", as: "intro"
  post "/books", to: "books#create"
  get "/books/new", to: "books#new", as: "create_book"
  get "/books/:id", to: "books#show", as: "book"
  patch "/books/:id", to: "books#update"
  get "/books/:id/edit", to: "books#edit", as: "edit_book"


 
  
  delete "/books/:id", to: "books#destroy", as: "delete"
end
