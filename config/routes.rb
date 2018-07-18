Rails.application.routes.draw do
  # needsのルート
  resources :needs
  get 'needs/search' => 'needs#search'
  root 'needs#top'

  # unsubscribe_commentsのルート
  get 'unsubscribe_comments/new' => 'unsubscribe_comments#new'
  get 'unsubscribe_comments/complete' => 'unsubscribe_comments#complete'

  # usersのルート
  get 'users/completion' => 'users#completion'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
