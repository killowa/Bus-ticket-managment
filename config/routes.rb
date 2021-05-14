Rails.application.routes.draw do


  devise_for :users, :controllers => { :registrations => 'registerations' }
 
  root "home#index"
  get "students/:id/trips-enroll", to: "trips#index"

  get "buses/:id/available-trips", to: "buses#available"
  get ":id/trips", to: "trips#list"
  get "trips", to: 'trips#list_all'
  post ":id/trips", to: "students#add_trip"
  delete "students/:student_id/trips/:id", to: "students#remove_trip"
  get "buses/:id/add_trip", to: "buses#add_trip" #prevent student from accessing it
  post "buses/:id/save_trip", to: "buses#save_trip"

  get "balance_update", to: "students#update_balance"

  patch "balance_update", to: "students#save_new_balance"


  resources :students
  resources :buses do
    resources :trips
  end
  resources :tickets

end
