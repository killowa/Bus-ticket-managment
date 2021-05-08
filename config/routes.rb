Rails.application.routes.draw do


  devise_for :users
  get "students/:id/trips-enroll", to: "trips#index"

  get "buses/:id/available-trips", to: "buses#available"
  get "students/:id/trips", to: "trips#list"
  post "students/:id/trips", to: "students#add_trip"
  delete "students/:student_id/trips/:id", to: "students#remove_trip"
  get "buses/:id/add_trip", to: "buses#add_trip"
  post "buses/:id/save_trip", to: "buses#save_trip"

  root "students#index"

  resources :students
  resources :buses do
    resources :trips
  end
  resources :tickets

end
