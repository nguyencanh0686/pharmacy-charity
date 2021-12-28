Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      namespace :entities do
        resources :ingredients
      end
    end
  end
end
