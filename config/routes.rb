Rails.application.routes.draw do
  get 'rsvps/create'
  get 'rsvps/destory'
  get 'rsvps/update'
  get 'user/index'
  get 'user/show'
  devise_for :users
  resources :users, :only => [:show]
  resources :events
  root 'events#index'
  devise_scope :user do
    get '/user/sign_out' => 'devise/sessions#destroy'
 end
end
