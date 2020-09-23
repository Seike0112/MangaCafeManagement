class UserUserSeatEndController < ApplicationController

  include UserSeatBill

  before_action :jwt_auth

  def index

    begin

      # 店舗管理者確認
      user = User.find_by(id: @jwt_data[:usid])
      render json: {err_msg: ['お客様情報が存在しません。']} and return if user.blank?
  
      # ブース情報選択
      booth = Booth.find_by(id: params[:booth_id])
      render json: {err_msg: ['ブース情報を入力して下さい。']} and return if booth.blank?

      # シート選択
      seat = Seat.find_by(id: params[:seat_id], booth_id: booth.id)
      render json: {err_msg: ['シート情報を入力して下さい。']} and return if seat.blank?

      # ユーザーの利用状況検索
      user_seat = UserSeat.find_by(user_id: user.id, booth_id: booth.id, seat_id: seat.id, bill_judge: false)

      render json: {err_msg: ['ご利用中のサービスは現在ございません。']} and return if user_seat.blank?
  
      @bill = bill(user, booth, seat, user_seat)

  
    rescue => e
  
      logger.error "Error: #{e}"
  
    end

  end

end