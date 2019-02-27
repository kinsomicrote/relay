Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      get 'users/:user_id/users', to: 'users#index'
      delete 'users/:id/users/:user_id', to: 'users#destroy'
    end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
