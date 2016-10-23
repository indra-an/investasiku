Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'

  devise_for :admins

  namespace :admins do
    get 'dashboard' => 'dashboard#index'
    get 'preferences' => 'dashboard#preferences'

    put 'update_full_name' => 'dashboard#update_full_name'
    put 'update_password' => 'dashboard#update_password'

    resources :admins, :except => [:show, :edit]
    resources :tags, :except => [:show]
    resources :glosarries
    resources :news
    resources :newsletter_queues
    resources :learning_modules
    resources :investment_tips
  end
end
