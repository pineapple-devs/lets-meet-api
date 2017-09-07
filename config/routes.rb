Rails.application.routes.draw do
  get 'login', :to => 'login#login'

  resources :users, :except => :index do
    get :sent_invitations, :controller => :users, :action => :sent_invitations
    get :received_invitations, :controller => :users, :action => :received_invitations

    resources :meetings do
      resources :invitations, :only => [:index, :show, :update]
      resources :intervals, :only => [:show, :create]
    end
  end
end
