Rails.application.routes.draw do
  get '/', to: "users#index"
  get '/focused', to: "users#focused"
  get '/all', to: "users#all"

  get '/auth/:provider/callback', to: 'users#auth'

  resources :problems, only: ["create", "solve", "focus", "unfocus"] do
    member do
      post 'solve'
      post 'focus'
      post 'unfocus'
    end
  end

  resources :hypotheses, only: ["create"]

  resources :users, only: ["index", "focused", "sign_out"] do
    collection do
      'focused'
    end

    member do
      get 'sign_out'
    end
  end
end
