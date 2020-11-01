Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  unauthenticated do
    root to: 'pages#home'
  end

  authenticated do
    root to: 'workers#index', as: :authenticated_root

    # admin
    get '/admin', to: 'pages#admin'
    patch 'admin/chantiers/:id', to: 'sites#toggle_confidence', as: 'toggle_site_confidence'
    patch 'admin/position/:id', to: 'position#toggle_confidence', as: 'toggle_posititon_confidence'
    delete 'admin/users/:id', to: 'users#destroy', as: 'users_destroy'

    # Profil
    patch '/profil/:id', to: 'pages#profil_update', as: 'profil'
    get '/profil/:id', to: 'pages#profil_show'


    # Non admin
    resources :positions, only: [:edit, :update, :destroy ]
    resources :chantiers, controller: 'sites', as: 'sites'

    resources :collaborateurs, controller: 'workers', as: 'workers' do
      resources :positions, only: [:new, :create]
      resources :graduates, only: [:new, :create]

    # resources :chantier, controller: 'sites', as: 'sites'
    # resources :diplomes, controller: 'graduates', as: 'graduates'
    end

  end

end
