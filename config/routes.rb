Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  namespace :api do
    namespace :v1 do
      resources :workouts, only: [:index]
      resources :exercises, only: [:index]
    end
  end
  resources :workouts do
    get :copy
    resources :exercises
  end
end
