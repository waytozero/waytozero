Rails.application.routes.draw do

  # ?
  get 'achievement_numbers/index'
  get 'achievement_categories/index'
  get 'categories/index'
  get 'challenges/index'
  get 'challenges/show'
  get 'challenges/update'
  get 'weekly_challenges/index'
  get 'weekly_challenges/create'
  get 'weekly_challenges/update'
  get 'successes/index'
  get 'successes/update'
  get 'successes/new'
  get 'successes/create'
  get 'users/edit'
  get 'users/update'

  #  good routes ?
  get '/dashboard', to: 'pages#dashboard'
  patch '/weekly_challenges/:id', to: 'weekly_challenges#update', as: 'update_challenge'
  devise_for :users
  resources :challenges, only: [:index, :show]
  devise_for :users, controllers: { sessions: 'users/sessions' } do
    resources :sucesses, only: [:index, :new, :create, :update]
  end
  resources :category, only: [:index] do
    resources :achievement_category, only: [:index]
    resources :achievement_number, only: [:index]
  end
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
