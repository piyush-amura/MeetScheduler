Rails.application.routes.draw do
  get 'venues/new'

  get 'venues/index'

  get 'venues/edit'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
