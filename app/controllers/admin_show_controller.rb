class AdminShowController < ApplicationController

  before_action :jwt_auth

  def index
    begin

      admin = Admin.find_by(id: @jwt_data[:adid])
      if admin.blank?
        render json: {err_msg: "店舗管理者情報が存在しません。"}
      else
        render json: {admin: admin} 
      end

    rescue => e
        
      logger.error "Error: #{e}"
  
    end
  end

end