Rails.application.routes.draw do
  resources :todo_lists do
    resources :tasks do 
      member do 
        patch :complete
      end 
    end 
  end
  devise_for :users
  root to: "todo_lists#index"
end
