Rails.application.routes.draw do

  # ver1.0.0 / create_Developer
  # ログイン
  post '/sign_in', to: 'signin#info'

  #　開発者専用情報閲覧ページ
  post '/owner_show', to: 'owner_show#index'
  #　開発者専用店舗情報一覧ページ
  post '/owner_admin_index', to: 'owner_admin_index#index'
  #　開発者専用店舗作成ページ
  post '/owner_admin_new', to: 'owner_admin_new#index'
  #　開発者専用店舗詳細編集ページ
  post '/owner_admin_edit', to: 'owner_admin_edit#index'

  #　店舗管理アカウント情報閲覧ページ
  post '/admin_show', to: 'admin_show#index'
  #　店舗管理アカウント用ユーザー情報作成ページ
  post '/admin_user_new', to: 'admin_user_new#index'
  #　店舗管理アカウント用ユーザー情報編集ページ
  post '/admin_user_edit', to: 'admin_user_edit#index'
  #　店舗管理アカウント用ユーザー一覧情報閲覧ページ
  post '/admin_user_index', to: 'admin_user_index#index'

end
