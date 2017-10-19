Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :cascade, only: [:index] do
    delete :hard_delete, on: :collection
    post :soft_delete, on: :collection
    post :undo_soft_delete, on: :collection
  end
  
end
