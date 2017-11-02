Rails.application.routes.draw do
  devise_for :usuarios, path: '', path_names: { sign_in: 'acceder', sign_out: 'salir'}
	root to: "landing#index"


	get 'dashboard' => 'dashboard#index', as: :dashboard
	get 'ingresar' => 'landing#ingresar', as: :ingresar


	as :usuario do
	  get 'ingresar', to: 'devise/sessions#new'
	end


end
