Rails.application.routes.draw do
  namespace :users do
    namespace :employees do
      resources :meetings
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
