Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  unauthenticated do
    root to: 'pages#home'
  end

  authenticated do
    root to: 'workers#index', as: :authenticated_root
  end

  resources :collaborateurs, controller: 'workers', as: 'workers' do
    resources :chantier, controller: 'sites', as: 'sites'
    resources :diplomes, controller: 'graduates', as: 'graduates'
  end
end
