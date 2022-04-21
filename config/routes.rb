Rails.application.routes.draw do
  get 'sessions/new'
  root 'static_pages#home'
  post 'schedules/:id' => 'schedules#show'
  get :about,          to: 'static_pages#about'
  get :use_of_terms,   to: 'static_pages#terms'
  get :signup,         to: 'users#new'
  get :signin,         to: 'sessions#new'
  post :signin,        to: 'sessions#create'
  delete :signout,     to: 'sessions#destroy'
  get :schedules_list, to: 'schedules#index'
  get :models_list,    to: 'models#index'
  resources :users
  resources :schedules
  resources :models
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
