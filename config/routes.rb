Rails.application.routes.draw do
  resources :students

  resources :trips do
    resources :buses
  end
end
