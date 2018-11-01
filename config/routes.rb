Rails.application.routes.draw do
  resources 'gossip'
  root 'static_pages#home'
  patch 'gossip/:id/edit', to: 'gossip#update'
  resources :gossips do
    resources :comments
  end

  resources :comments do
    resources :comments
  end
end
