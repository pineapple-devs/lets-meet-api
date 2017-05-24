Rails.application.routes.draw do
  resources :intervals
  resources :users do
    resources :meetings
  end
end
