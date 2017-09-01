Rails.application.routes.draw do
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
      resources :meetings
    end
  end

  devise_for :users
  resources :venues, :agendas, :suggestions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
