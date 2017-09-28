Rails.application.routes.draw do
  devise_for :users

  namespace :users do
    namespace :employees do
      resources :meetings do
        get 'add_members', on: :member
        post 'add_members', on: :member
        get 'remove_members', on: :member
        post 'remove_members', on: :member
      end
    end
  end

  namespace :users do
    namespace :admins do
      resources :meetings do
        get 'add_members', on: :member
        post 'add_members', on: :member
        get 'remove_members', on: :member
        post 'remove_members', on: :member
      end
    end
  end

  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :venues do
    post 'search', on: :collection
  end

  resources :agendas, :suggestions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
