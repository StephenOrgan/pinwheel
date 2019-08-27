Rails.application.routes.draw do
  class Subdomain
      def self.matches?(request)
        subdomains = %w{ www admin }
        request.subdomain.present? && !subdomains.include?(request.subdomain)
      end
  end
  namespace :api do
    namespace :admin do
      constraints Subdomain do
      resources :accounts
    end
  end
  namespace :v1 do
    constraints Subdomain do
    resources :integrations
    resources :accounts
  end
end
root 'home#index'
end



  	root to: "home#index"

    get "pinwheel_sign_in", controller: :pinwheel_sessions, action: :new
    post "signup", controller: :signup, action: :create
    post "refresh", controller: :refresh, action: :create
  	post "signin", controller: :signin, action: :create
  	post "signup", controller: :signup, action: :create
  	delete "signin", controller: :signin, action: :destroy
end
