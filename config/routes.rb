Rails.application.routes.draw do
  get 'schedules/index'
  get :schedule,       to: 'schedules#show'
  get 'sessions/new'
  root 'static_pages#home'
  get :about,          to: 'static_pages#about'
  get :use_of_terms,   to: 'static_pages#terms'
  get :signup,         to: 'users#new'
  get :signin,         to: 'sessions#new'
  post :signin,        to: 'sessions#create'
  delete :signout,     to: 'sessions#destroy'
  resources :users
  resources :schedules
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
