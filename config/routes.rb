Rails.application.routes.draw do
  root "posts#index"

  get "/posts", to: "posts#index"
  get "/posts/index", to: "posts#index"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
