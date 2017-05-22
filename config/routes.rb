Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'

  mount_devise_token_auth_for 'GameMaker', at: 'gamemaker_auth'
  as :game_maker do
    # Define routes for GameMaker within this block.
  end

  resources :users 
end
