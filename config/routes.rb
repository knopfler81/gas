Rails.application.routes.draw do
  devise_for :users
	root to: "consumptions#index"
	resources :consumptions
end