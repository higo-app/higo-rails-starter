Rails.application.routes.draw do
  scope :api do
    resources :payments
    resources :invoices
  end

  devise_for :users

  # Comment out to use React
  root to: 'pages#index'
  %w[about].each do |page|
    get page, to: 'pages#show'
  end

  # Uncomment to use React
  # root to: 'react_app#index'
  # get '*path', to: 'react_app#index'
end
