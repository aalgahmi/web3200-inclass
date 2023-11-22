Rails.application.routes.draw do
  resources :students, except: [:destroy]
  
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "clearance/users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end
  
  resources :appointments
  resources :availabilities

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get 'pages/appointments', to: 'pages#appointments'

  resources :tutors do
    resources :availabilities do
      resources :appointments, only: [:new, :create, :destroy]
    end
  end
  resources :courses

  # Add the new route for the users action
  get 'pages/users', to: 'pages#users', as: 'users_page'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  constraints Clearance::Constraints::SignedIn.new do
    root "pages#dashboard", as: :dashboard
  end
  constraints Clearance::Constraints::SignedOut.new do
    root "pages#home"
  end
end

