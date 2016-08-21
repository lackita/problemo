Rails.application.routes.draw do
  get '/', to: "application#index"
  resources :problems, only: ["create", "solve"] do
    member do
      post 'solve'
    end
  end
end
