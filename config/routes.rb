Rails.application.routes.draw do
  devise_for :users

  root "chat_rooms#index"

  resources :chat_rooms, only: [:index, :new, :show, :create]
  resources :messages, only: :create

  mount ActionCable.server => "/cable"
end
