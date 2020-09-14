class AdminSeatShowController < ApplicationController

  before_action :jwt_auth

  def index
    begin

      admin = Admin.find_by(id: @jwt_data[:adid])
      render json: {err_msg: "店舗管理者情報が存在しません。"} and return if admin.blank?

      booth = Booth.find_by(id: params[:id], admin_id: @jwt_data[:adid])
      render json: {err_msg: "ブース情報が存在しません。"} and return if booth.blank?

      seat = Seat.find_by(id: params[:seat_id], booth_id: booth.id)
      render json: {err_msg: "ブース内のシート情報が存在しません。"} and return if seat.blank?
      render json: {seat: seat}


    rescue => e
        
      logger.error "Error: #{e}"
  
    end
  end

end