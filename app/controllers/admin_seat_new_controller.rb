class AdminSeatNewController < ApplicationController

  before_action :jwt_auth

  def index

    begin

      # 店舗管理者確認
      admin = Admin.find_by(id: @jwt_data[:adid])
      render json: {err_msg: ['店舗管理者情報が存在しません。']} and return if admin.blank?
      # ブース確認
      booth = Booth.find_by(id: params[:id])
      render json: {err_msg: ['ブース情報が存在しません。']} and return if booth.blank?


      #　シート作成
      seat = Seat.new({
        se_number: booth.bo_name,
        booth_id: booth.id,
      })
      seat.save!

      render json: {fl_msg: "#{admin.ad_name}：　#{booth.bo_name}のシート#{seat.id}を作成しました。"}

    rescue => e

      logger.error "Error: #{e}"

    end

  end

end