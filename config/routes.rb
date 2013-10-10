GuestByte::Application.routes.draw do
  devise_for :users, :controllers => { :registrations => "registrations", :sessions => "sessions" }
  get "guests/create"
  get "responses/create"
  get "responses/delete"
  get "static_pages/home"
  get "static_pages/about"
  get "static_pages/contact"
  resources 'users', only: [:show] do
    resources :events
  end
  resources 'events', only: [:new, :index, :create, :show, :destroy]
  resources 'guests', only: [:create]
  resources 'prompts', only: [:create]
  resources 'responses', only: [:create]
  root 'static_pages#home'
end
