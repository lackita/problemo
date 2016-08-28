Rails.application.routes.draw do
  get '/', to: "application#index"

  get '/auth/:provider/callback', to: 'users#auth'

  resources :problems, only: ["create", "solve", "focus", "unfocus"] do
    member do
      post 'solve'
      post 'focus'
      post 'unfocus'
    end
  end

  resources :hypotheses, only: ["create"]

  resources :users, only: ["sign_out"] do
    member do
      get 'sign_out'
    end
  end
end
