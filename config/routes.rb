Rails.application.routes.draw do


  devise_for :users
  get "students/:id/trips-enroll", to: "trips#index"

  get "buses/:id/available-trips", to: "buses#available"
  get "trips", to: "trips#index"

  root "students#index"

  resources :students
  resources :buses do
    resources :trips
  end
  resources :tickets

end
