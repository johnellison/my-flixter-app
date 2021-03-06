Rails.application.routes.draw do
  get 'enrollments/create'

  devise_for :users
  root 'static_pages#index'
  get 'about', to: 'static_pages#about'

  resource :dashboard, only: :show

  resources :courses, only: [:index, :show] do
    resources :enrollments, only: :create
  end

  resources :lessons, only: [:show]

  namespace :teacher do
    resources :lessons, only: :update
    resources :sections, only: :update
    resources :sections, only: [] do
      resources :lessons, only: [:create]
    end
    resources :courses, only: [:new, :create, :show] do
      resources :sections, only: [:create ]
    end
  end

end
