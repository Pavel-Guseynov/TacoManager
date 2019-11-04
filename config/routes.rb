# frozen_string_literal: true

Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    resources :tacos, only: %i[index show]

    resources :orders do
      member do
        get :confirm
        get :complete
      end
    end

    post 'manager_auth' => 'manager_token#create'
  end
end
