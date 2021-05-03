Rails.application.routes.draw do


  devise_for :users
  get "students/:id/trips-enroll", to: "trips#index"

  get "buses/:id/available-trips", to: "buses#available"

  root "students#index"

  resources :students
  resources :buses
  resources :trips
  resources :tickets

end
