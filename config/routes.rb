Rails.application.routes.draw do

  # ver1.0.0 / create_Developer
  # ログイン
  post '/sign_in', to: 'signin#info'

  #　開発者専用ページ
  post '/owner_show', to: 'owner_show#index'

end
