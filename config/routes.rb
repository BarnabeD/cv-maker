Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  unauthenticated do
    root to: 'pages#home'
  end

  authenticated do
    root to: 'pages#admin', as: :authenticated_root

    # admin
    get '/admin', to: 'pages#admin'
    patch 'admin/chantiers/:id', to: 'sites#toggle_confidence', as: 'toggle_site_confidence'
    patch 'admin/position/:id', to: 'position#toggle_confidence', as: 'toggle_posititon_confidence'

    post 'admin/users', to: 'users#create', as: 'users'
    get 'admin/user/new', to: 'users#new', as: 'new_user'
    get 'admin/user/:id', to: 'users#edit', as: 'edit_user'
    patch 'admin/user/:id', to: 'users#update'
    delete 'admin/user/:id', to: 'users#destroy', as: 'users_destroy'

    # Profil
    patch '/profil/:id', to: 'pages#profil_update', as: 'profil'
    get '/profil/:id', to: 'pages#profil_show'


    # export worker PDF
    # get '/collaborateurs/:id', to: 'workers#export'


    # Non admin
    resources :positions, only: [:edit, :update, :destroy ]
    resources :chantiers, controller: 'sites', as: 'sites'
    resources :companies, exept: [:show, :index]

    resources :collaborateurs, controller: 'workers', as: 'workers' do
      get '/pdf', to: 'workers#pdf'
      resources :positions, only: [:new, :create]
      resources :graduates, only: [:new, :create]

    # resources :chantier, controller: 'sites', as: 'sites'
    # resources :diplomes, controller: 'graduates', as: 'graduates'
    end

  end

end
