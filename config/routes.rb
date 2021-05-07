Rails.application.routes.draw do


  devise_for :users
  get "students/:id/trips-enroll", to: "trips#index"

  get "buses/:id/available-trips", to: "buses#available"
  get "trips", to: "trips#list"
  get "trips/add", to: "trips#add"

  root "students#index"

  resources :students
  resources :buses do
    resources :trips
  end
  resources :tickets

end
