Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  mount_devise_token_auth_for 'GameMaker', at: 'gamemaker_auth'
  as :game_maker do
    # Define routes for GameMaker within this block.
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :topics do
    resources :quizzes
  end

  get '/user/:id', to: 'user#show'
end
