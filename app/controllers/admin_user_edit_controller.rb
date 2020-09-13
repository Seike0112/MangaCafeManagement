class AdminUserEditController < ApplicationController

  before_action :jwt_auth

  # 開発者情報編集
  def index
    begin

      if params[:us_delete_msg].present?

        # 店舗管理者確認
        admin = Admin.find_by(id: @jwt_data[:adid])
        render json: {err_msg: ['開発者情報が存在しません。']} and return if admin.blank?

        # ユーザー検索
        user = User.find_by(id: params[:id], admin_id: @jwt_data[:adid])
        render json: {err_msg: ['店舗管理者情報が存在しません。']} and return if user.blank?

        #削除する名前をメッセージ表示させるために、変数に格納
        user_delete_name = user.user_full_name

        #削除
        user.destroy!

        render json: {delete_msg: "#{user_delete_name}の情報を削除しました。"}

      else

        # 店舗管理者確認
        admin = Admin.find_by(id: @jwt_data[:adid])
        render json: {err_msg: ['開発者情報が存在しません。']} and return if admin.blank?

        # ユーザー検索
        user = User.find_by(id: params[:id], admin_id: @jwt_data[:adid])
        render json: {err_msg: ['店舗管理者情報が存在しません。']} and return if user.blank?

        err_msg = []
        #パラメータチェック
        err_msg << '名前が入力されていません。' if params[:us_full_name].blank?
        err_msg << 'メールアドレスが入力されていません。' if params[:us_email].blank?
        err_msg << 'パスワードが入力されていません。' if params[:password].blank?
        err_msg << 'カナを入力してください。' if params[:us_kana].blank?
        err_msg << '職業を入力してください。' if params[:us_job].blank?
        err_msg << '年齢を入力してください。' if params[:us_age].blank?
        err_msg << '性別を入力してください。' if params[:us_sex].blank?
        err_msg << '電話番号を入力してください。' if params[:us_phone].blank?
        err_msg << '住所を入力してください。' if params[:us_address].blank?
        err_msg << '郵便番号を入力してください。' if params[:us_post_number].blank?
        render json: {err_msg: err_msg} and return if err_msg.present?

        #　メールアドレス重複チェック
        user_email_check = User.find_by(us_email: params[:us_email])
        render json: {err_msg: "このメールアドレスは使用されています。"} and return if user_email_check.present?

        #　ユーザー作成
        user.update!({
          us_full_name: params[:us_full_name],
          us_email: params[:us_email],
          password: params[:password],
          us_kana: params[:us_kana],
          us_job: params[:us_job],
          us_sex: params[:us_sex],
          us_age: params[:us_age],
          us_phone: params[:us_phone],
          us_address: params[:us_address],
          us_post_number: params[:us_post_number],
        })

        render json: {fl_msg: "#{admin.ad_name}：　会員番号#{user.id}を編集しました。"}

      end

    rescue => e
        
      logger.error "Error: #{e}"
  
    end
  end

end