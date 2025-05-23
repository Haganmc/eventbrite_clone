Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [ :show ]
  resources :events do
    resource :event_attendee, only: [ :create, :destroy ]
  end
  root "events#index"
end
