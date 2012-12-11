Mingle::Application.routes.draw do
 
  resources :boards do
    member do 
      get :join
    end
  end

  resources :players do 
    member do 
      get :move
    end
  end
  root :to => 'main#index'

 
end
