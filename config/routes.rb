Rails.application.routes.draw do
  get 'login', :to => 'login#login'

  resources :users, :except => :index do
    get :invitations, :controller => :users, :action => :invitations

    resources :meetings do
      resources :invitations, :only => [:index, :show, :update]
      resources :intervals, :only => [:show, :create]
    end
  end
end
