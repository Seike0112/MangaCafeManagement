class AdminBoothIndexController < ApplicationController

  before_action :jwt_auth

  # 開発者情報閲覧
  def index
    begin 

      # 店舗管理者確認
      admin = Admin.find_by(id: @jwt_data[:adid])
      render json: {err_msg: ['店舗管理者情報が存在しません。']} and return if admin.blank?

      booths = Booth.all
      if booths.present?
        render json: {booths: booths}
      else
        render json: {err_msg: "該当する店舗が見つかりませんでした。"}
      end

    rescue => e
        
      logger.error "Error: #{e}"
  
    end
  end

end