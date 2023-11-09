Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :index]
  get 'tagsearches/search', to: 'tagsearches#search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end