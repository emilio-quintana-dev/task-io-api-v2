Rails.application.routes.draw do
      resources :users, param: :_username
      resources :todos
      post '/auth/login', to: "auth#login"
end
