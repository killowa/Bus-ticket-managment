Rails.application.routes.draw do
  
  get 'buses/index'
  get 'buses/new'
  get 'buses/show'
  get 'buses/update'
  get 'buses/edit'
  get 'buses/destroy'
  get 'buses/create'
  root "students#index"

  get "students/:id/trips-enroll", to: "trips#index"

  resources :students

  resources :trips do
    resources :buses
  end
end
