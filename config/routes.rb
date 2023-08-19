Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #  root "home#index"
  #  devise_for :students
  #  devise/sessions#new
  # root to: 'devise/sessions#new'
  # devise_scope :students do
  #   get "/some/route" => "some_devise_controller"
  #   end


  devise_for :students

  devise_scope :student do
    authenticated :student do
      root  "home#index", as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  resources :txns do
    member do
    end
    collection do
      get :mess_wallet
      get :daily_marketing
      get :miscellaneous
      get :guest_meal
      get :fund_wallet
    end
  end
  resources :students
  resources :mess_managers
  resources :fund_managers
  resources :general_secretarys
  resources :assistant_general_secretarys
end
