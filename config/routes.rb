Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      namespace :entities do
        resources :ingredients
      end

      namespace :users do
        resources :registrations, only: [:create]
      end
    end
  end
end
