Rails.application.routes.draw do
  get '/', to: "application#index"
  resources :problems do
    member do
      post 'solve'
    end
  end
end
