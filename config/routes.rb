Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :collaborateurs, controller: 'workers', as: 'workers' do
  # resources :workers, as: 'salarie' do
    resources :chantier, controller: 'sites', as: 'sites'
  end
end
