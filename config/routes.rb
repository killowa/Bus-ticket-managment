Rails.application.routes.draw do


  devise_for :users
  get "students/:id/trips-enroll", to: "trips#index"

  get "buses/:id/available-trips", to: "buses#available"
  get "trips", to: "trips#list"
  get "buses/:id/add_trip", to: "buses#add_trip"
  post "buses/:id/save_trip", to: "buses#save_trip"

  root "students#index"

  resources :students
  resources :buses do
    resources :trips
  end
  resources :tickets

end
