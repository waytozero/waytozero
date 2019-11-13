Rails.application.routes.draw do
  resources :challenges, only: [:show, :update]
  get '/dashboard/', to: 'pages#dashboard'

  resources :weekly_challenges, only: [:create, :update]
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' } do
    resources :sucesses, only: [:index, :new, :create, :update]
  end
  resources :categories, only: [:index] do
    resources :challenges, only: [:index]
    resources :achievement_category, only: [:index]
    resources :achievement_number, only: [:index]
  end
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
