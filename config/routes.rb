Rails.application.routes.draw do
	root to: "consumptions#index"
	resources :consumptions
end
