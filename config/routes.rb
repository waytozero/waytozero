Rails.application.routes.draw do
  resources :challenges, only: [:show, :update]
  get '/dashboard/', to: 'pages#dashboard'
  resources :weekly_challenges, only: [:update]
  devise_for :users, controllers: { sessions: 'users/sessions' } do
    resources :sucesses, only: [:index, :new, :create, :update]
    resources :weekly_challenges, only: [:index]
  end
  resources :category, only: [:index] do
    resources :challenges, only: [:index]
    resources :achievement_category, only: [:index]
    resources :achievement_number, only: [:index]
  end
  root to: 'pages#home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
