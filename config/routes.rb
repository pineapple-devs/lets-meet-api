Rails.application.routes.draw do
  resources :users do
    resources :meetings do
      resources :intervals
    end
  end
end
