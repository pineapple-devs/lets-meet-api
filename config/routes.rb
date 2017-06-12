Rails.application.routes.draw do
  get 'login', :to => 'login#login'

  resources :users do
    resources :meetings do
      resources :intervals
    end
  end
end
