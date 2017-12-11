Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/barkath/builders/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :pages, only: [:index] do
    post :submit_form, on: :collection
    get :featured_projects, on: :collection
    get :gallery, on: :collection
  end

  root 'pages#index'
  get '*path' => redirect('/')
  
end
