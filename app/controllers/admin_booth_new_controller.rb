class AdminBoothNewController < ApplicationController

  before_action :jwt_auth

  def index
    begin

        # 店舗管理者確認
        admin = Admin.find_by(id: @jwt_data[:adid])
        render json: {err_msg: ['店舗管理者情報が存在しません。']} and return if admin.blank?

        err_msg = []
        #パラメータチェック
        err_msg << '名前が入力されていません。' if params[:bo_name].blank?
        err_msg << '金額が入力されていません。' if params[:bo_price].blank?
        render json: {err_msg: err_msg} and return if err_msg.present?

        #　ブース名重複チェック
        booth_name_check = Booth.find_by(bo_name: params[:bo_name])
        render json: {err_msg: "このブース名は使用されています。"} and return if booth_name_check.present?

        #　ユーザー作成
        booth = Booth.new({
          bo_name: params[:bo_name],
          bo_type: params[:bo_type],
          bo_price: params[:bo_price],
          bo_remarks: params[:bo_remarks],
          admin_id: admin.id,
        })
        booth.save!

        render json: {fl_msg: "#{admin.ad_name}：　#{booth.bo_name}を作成しました。"}

    rescue => e
        
      logger.error "Error: #{e}"
  
    end
  end

end