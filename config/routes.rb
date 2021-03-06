Rails.application.routes.draw do

  ##============================================================##
  ## Locale (all the other routes should be nested in that scope in order to have language first in url)
  ##============================================================##
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/  do

  root  "pages#home"

  resources :challenges, only: [:show, :update]
  get '/dashboard/', to: 'pages#dashboard'
  get '/thanks/', to: 'pages#thanks'
  get '/journal/', to: 'pages#journal'
  get '/suggest/', to: 'pages#suggest'

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
end
