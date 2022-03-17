Rails.application.routes.draw do
  root 'static_pages#home'
  get :about,        to: 'static_pages#about'
  get :use_of_terms, to: 'static_pages#terms'
  get :signup,       to: 'users#new'
  get :signin,       to: 'users#signin'
  resources :users  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
