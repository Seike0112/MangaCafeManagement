class UserSeatIndexController < ApplicationController

  before_action :jwt_auth

  def index

    begin

      # 店舗管理者確認
      user = User.find_by(id: @jwt_data[:usid])
      render json: {err_msg: ['お客様情報が存在しません。']} and return if user.blank?
  
      # ブース情報選択
      booth = Booth.find_by(id: params[:booth_id])
      render json: {err_msg: ['ブース情報を入力して下さい。']} and return if booth.blank?
  
      # 空席状態の各ブースのシートを表示する。
      seat_false_status = Seat.where(se_use_status: false, booth_id: booth.id)
  
      render json: {seat__false_status: seat_false_status}
  
  
    rescue => e
  
      logger.error "Error: #{e}"
  
    end

  end

end