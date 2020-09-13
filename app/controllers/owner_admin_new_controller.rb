class OwnerAdminNewController < ApplicationController

  before_action :jwt_auth

  # 開発者情報編集
  def index
    begin

        # 開発者確認
        owner = Owner.find_by(id: @jwt_data[:ownid])
        render json: {err_msg: ['開発者情報が存在しません。']} and return if owner.blank?

        err_msg = []
        #パラメータチェック
        err_msg << '名前が入力されていません。' if params[:ad_name].blank?
        err_msg << 'メールアドレスが入力されていません。' if params[:ad_email].blank?
        err_msg << 'パスワードが入力されていません。' if params[:password].blank?
        err_msg << '紹介・説明欄を入力してください。' if params[:ad_description].blank?
        render json: {err_msg: err_msg} and return if err_msg.present?

        admin = Admin.new({
          ad_name: params[:ad_name],
          ad_email: params[:ad_email],
          password: params[:password],
          ad_description: params[:ad_description],
        })
        admin.save!

        render json: {fl_msg: "#{admin.ad_name}を作成しました。"}

    rescue => e
        
      logger.error "Error: #{e}"
  
    end
  end

end