Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "user#index"
  #user routes
  resources :user, only: %i[index show] do
    #post routes
    resources :posts, only: %i[index show new create] do
      resources :comments, only: %i[create destroy]
      resources :likes, only: %i[create destroy]
    end
  end

  

  

  

end