class AdminSeatEditController < ApplicationController

  before_action :jwt_auth

  def index

    begin

      # 店舗管理者確認
      admin = Admin.find_by(id: @jwt_data[:adid])
      render json: {err_msg: ['店舗管理者情報が存在しません。']} and return if admin.blank?
      # ブース確認
      booth = Booth.find_by(id: params[:id])
      render json: {err_msg: ['ブース情報が存在しません。']} and return if booth.blank?

      # シート確認
      seat = Seat.find_by(booth_id: booth.id, id: params[:seat_id])

      #　シート作成
      seat.update!({
        se_name: booth.bo_name,
      })

      render json: {fl_msg: "#{admin.ad_name}：　#{booth.bo_name}のシート#{seat.id}を作成しました。"}

    rescue => e

      logger.error "Error: #{e}"

    end

  end

end