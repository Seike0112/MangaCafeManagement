Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # ver1.0.0 / create_Developer
  post '/sign_in', to: 'signin#info'
end
