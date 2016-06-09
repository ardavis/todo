Rails.application.routes.draw do
  root to: 'lists#index'

  resources :lists do
    resources :todos, except: [:index] do
      post :reopen, on: :member
      post :complete, on: :member
    end
  end
  

end
