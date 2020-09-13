class OwnerAdminEditController < ApplicationController

  before_action :jwt_auth

  # 開発者情報編集
  def index
    begin

      if params[:ad_delete_msg].present?

        # 開発者確認
        owner = Owner.find_by(id: @jwt_data[:ownid])
        render json: {err_msg: ['開発者情報が存在しません。']} and return if owner.blank?

        # 店舗管理者検索
        admin = Admin.find_by(id: params[:id], owner_id: @jwt_data[:ownid])
        render json: {err_msg: ['店舗管理者情報が存在しません。']} and return if admin.blank?

        #削除する名前をメッセージ表示させるために、変数に格納
        admin_delete_name = admin.ad_name

        #削除
        admin.destroy!

        render json: {delete_msg: "#{admin_delete_name}の情報を削除しました。"}

      else

        # 開発者確認
        owner = Owner.find_by(id: @jwt_data[:ownid])
        render json: {err_msg: ['開発者情報が存在しません。']} and return if owner.blank?

        # 店舗管理者検索
        admin = Admin.find_by(id: params[:id], owner_id: @jwt_data[:ownid])
        render json: {err_msg: ['店舗管理者情報が存在しません。']} and return if admin.blank?

        err_msg = []
          #パラメータチェック
          err_msg << '名前が入力されていません。' if params[:ad_name].blank?
          err_msg << 'メールアドレスが入力されていません。' if params[:ad_email].blank?
          err_msg << '紹介・説明欄を入力してください。' if params[:ad_description].blank?
          render json: {err_msg: err_msg} and return if err_msg.present?

        admin.update!(
          ad_name: params[:ad_name],
          ad_email: params[:ad_email],
          ad_description: params[:ad_description],
        )

        render json: {fl_msg: "#{admin.ad_name}を更新しました。"}

      end

    rescue => e
        
      logger.error "Error: #{e}"
  
    end
  end

end