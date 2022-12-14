Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #
  root to: redirect('/api-docs')
  namespace :api do
    namespace :v1 do
      resources :transactions
    end
  end
end
