Rails.application.routes.draw do

  get "students/:id/trips-enroll", to: "trips#index"

  root "students#index"

  resources :students
  resources :buses
  resources :trips

end
