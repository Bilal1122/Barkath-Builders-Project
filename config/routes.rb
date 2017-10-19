Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cascade, only: [:index] do
    post :soft_delete, on: :collection
    delete :hard_delete, on: :collection
  end
  
end
