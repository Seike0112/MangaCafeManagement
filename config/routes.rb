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

  #　店舗管理アカウント用ブース一覧情報閲覧ページ
  post '/admin_booth_index', to: 'admin_booth_index#index'
  #店舗管理アカウント用ブース情報作成ページ
  post '/admin_booth_new', to: 'admin_booth_new#index'
  #店舗管理アカウント用ブース情報編集ページ
  post '/admin_booth_edit', to: 'admin_booth_edit#index'
  #店舗管理アカウント用ブース情報閲覧ページ
  post '/admin_booth_show', to: 'admin_booth_show#index'

  #　店舗管理アカウント用シート一覧情報閲覧ページ
  post '/admin_seat_index', to: 'admin_seat_index#index'
  #店舗管理アカウント用シート情報編集ページ
  post '/admin_seat_edit', to: 'admin_seat_edit#index'
  #店舗管理アカウント用シート情報作成ページ
  post '/admin_seat_new', to: 'admin_seat_new#index'
  #店舗管理アカウント用シート情報閲覧ページ
  post '/admin_seat_show', to: 'admin_seat_show#index'

end
