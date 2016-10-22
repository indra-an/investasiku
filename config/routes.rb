Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'home#index'

  devise_for :admins

  namespace :admins do
    get 'dashboard' => 'dashboard#index'

    put 'update_full_name' => 'dashboard#update_full_name'
    put 'update_password' => 'dashboard#update_password'
    post 'queue_newsletter' => 'dashboard#queue_newsletter'

    resources :admins, :except => [:show, :edit]
    resources :tags, :except => [:show]
    resources :glosarries
    resources :news
    resources :newsletter_queues
  end
end
