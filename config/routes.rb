Rails.application.routes.draw do
  devise_for :usuarios
	root to: "landing#index"


	get 'dashboard' => 'dashboard#index', as: :dashboard


end
