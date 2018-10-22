Rails.application.routes.draw do
	root to: "consumptions#new"
	resources :consumptions
end
