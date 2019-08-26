Rails.application.routes.draw do
  namespace :api do
 		namespace :admin do
  			resources :accounts
  		end
  		namespace :v1 do
  			resources :integrations
        resources :accounts
        resources :customers
  		end
      root 'home#index'
  	end


  	root to: "home#index"

    get "subdomains", controller:  :subdomain, action: :get
    get "pinwheel_sign_in", controller: :pinwheel_sessions, action: :new
    post "signup", controller: :signup, action: :create
    post "refresh", controller: :refresh, action: :create
  	post "signin", controller: :signin, action: :create
  	post "signup", controller: :signup, action: :create
  	delete "signin", controller: :signin, action: :destroy
end
