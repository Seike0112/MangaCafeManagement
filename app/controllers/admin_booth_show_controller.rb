class AdminBoothShowController < ApplicationController

  before_action :jwt_auth

  def index
    begin

      admin = Admin.find_by(id: @jwt_data[:adid])
      render json: {err_msg: "店舗管理者情報が存在しません。"} and return if admin.blank?

      booth = Booth.find_by(id: params[:id], admin_id: @jwt_data[:adid])
      render json: {booth: booth}

    rescue => e
        
      logger.error "Error: #{e}"
  
    end
  end

end