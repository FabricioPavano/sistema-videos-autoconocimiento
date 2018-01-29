Rails.application.routes.draw do
  devise_for :usuarios, path: '', path_names: { sign_in: 'ingresar', sign_out: 'salir'}, :controllers => { confirmations: 'confirmations', registrations: 'registrations' }
	root to: "landing#index"


	get 'dashboard' => 'dashboard#index', as: :dashboard

	as :usuario do
	  get 'ingresar', to: 'devise/sessions#new'
	  get 'cambiar-contrasena', to: 'devise/passwords#new'
	end

end
