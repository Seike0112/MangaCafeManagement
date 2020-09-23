class AdminUserSeatIndexController < ApplicationController

  before_action :jwt_auth

  def index

    begin

      # 店舗管理者確認
      admin = Admin.find_by(id: @jwt_data[:adid])
      render json: {err_msg: ['管理者情報が存在しません。']} and return if admin.blank?
  
      # ブース情報検索
      booth = Booth.find_by(id: params[:booth_id])
  
      # 利用中の受付を表示する。
      if booth
        user_seats = UserSeat.where(booth_id: booth.id)
      else
        user_seats = UserSeat.all
      end

      render json: {err_msg: ['利用中の情報が存在しません。']} if user_seats.blank?
  
      render json: {user_seats: user_seats}
  
  
    rescue => e
  
      logger.error "Error: #{e}"
  
    end

  end

end