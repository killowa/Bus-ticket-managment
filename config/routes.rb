Rails.application.routes.draw do
  
  root "students#index"
  
  resources :students

  resources :trips do
    resources :buses
  end
end
