Rails.application.routes.draw do
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :courses

  resources :materials, only: [:index, :create, :destroy]

  resources :sessions, only: [:create]
end
