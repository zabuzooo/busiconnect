Rails.application.routes.draw do

  devise_for :users, :controllers => {
  :registrations => 'users/registrations'}
  devise_scope :user do
    post 'users/sign_up/confirm' => 'users/registrations#confirm'
    post 'users/sign_up/complete' => 'users/registrations#complete'
    get 'users/sign_up/back' => 'users/registrations#back'
    get '/logout', to: 'devise/sessions#destroy', as: :logout
  end
  # needsのルート
  get 'needs/search' => 'needs#search'
  root 'needs#index'
  get '/introduction' => 'needs#introduction'
  resources :needs, :except => :index

  # unsubscribe_commentsのルート
  get '/unsubscribe_comments/new' => 'unsubscribe_comments#new'
  get '/unsubscribe_comments/complete' => 'unsubscribe_comments#complete'
  post '/unsubscribe_comments' => 'unsubscribe_comments#create'

  # usersのルート
  get 'users/completion' => 'users#completion'
  resources :users, only: [:index, :show, :edit, :update]

    # テスト
  post '/test/:id' => 'matchings#create', as: 'test'
  resources :matchings
  get 'notifications/:id/link_through', to: 'notifications#link_through',as: :link_through
  get 'notifications/link_through'
  resources :types, only: [:show]
  resources :place_fields, only: [:show]
  resources :purposes, only: [:show]

  get '/use' => 'users#use'
  get '/law' => 'users#law'
  get '/forces' => 'users#forces'
  get '/agreement' => 'users#agreement'

  get 'user_company/:id' => 'users#company', as: 'company'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
