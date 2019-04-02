Rails.application.routes.draw do
  # get 'photo/index'
  # get 'photo/store'
  root 'photo#index'
  post 'photo/store'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
