class AdminUserNewController < ApplicationController

  before_action :jwt_auth

  def index
    begin

        # 店舗管理者確認
        admin = Admin.find_by(id: @jwt_data[:adid])
        render json: {err_msg: ['店舗管理者情報が存在しません。']} and return if admin.blank?

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
        user = User.new({
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
          admin_id: admin.id,
        })
        user.save!

        render json: {fl_msg: "#{admin.ad_name}：　会員番号#{user.id}を作成しました。"}

    rescue => e
        
      logger.error "Error: #{e}"
  
    end
  end

end