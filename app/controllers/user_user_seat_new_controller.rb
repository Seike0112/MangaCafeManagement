class UserUserSeatNewController < ApplicationController

  before_action :jwt_auth

  def index

    begin

      # 受付状態チェック
      user_seat_status = UserSeat.find_by(user_id: @jwt_data[:usid], usse_use_status: true)
      render json: {err_msg: ['すでに利用しているサービスがあります。']} and return if user_seat_status

      # 店舗管理者確認
      user = User.find_by(id: @jwt_data[:usid])
      render json: {err_msg: ['お客様情報が存在しません。']} and return if user.blank?
  
      # ブース情報選択
      booth = Booth.find_by(id: params[:booth_id])
      render json: {err_msg: ['ブース情報を入力して下さい。']} and return if booth.blank?
      # シート選択
      seat = Seat.find_by(id: params[:seat_id], booth_id: booth.id)
      render json: {err_msg: ['シート情報を入力して下さい。']} and return if seat.blank?
  
      user_seat = UserSeat.new({
        start: I18n.l(DateTime.now, format: :default),
        bill_judge: false,
        booth_price: booth.bo_price,
        booth_type: booth.bo_type,
        usse_use_status: true,
        seat_id: seat.id,
        booth_id: booth.id,
        user_id: user.id,
      })
      user_seat.save!

      # se_use_statusがtrueのときはシートを利用中
      seat.update!({
        se_use_status: true
      })
  
      render json: {fl_msg: "#{user.us_full_name}様：　#{I18n.l(user_seat.start, format: :default)}より#{booth.bo_name}で、#{seat.id}番シートをご用意致しました。"}
  
        
    rescue => e
  
      logger.error "Error: #{e}"
  
    end

  end

end