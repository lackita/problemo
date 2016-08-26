Rails.application.routes.draw do
  get '/', to: "application#index"

  get '/auth/:provider/callback', to: 'users#auth'

  resources :problems, only: ["create", "solve"] do
    member do
      post 'solve'
    end
  end
end
