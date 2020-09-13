class OwnerAdminIndexController < ApplicationController

  before_action :jwt_auth

  # 開発者情報閲覧
  def index
    begin 

      # 開発者確認
      owner = Owner.find_by(id: @jwt_data[:ownid])
      render json: {err_msg: ['開発者情報が存在しません。']} and return if owner.blank?

      admins = Admin.all
      if admins.present?
        render json: {admins: admins}
      else
        render json: {err_msg: "該当する店舗が見つかりませんでした。"}
      end

    rescue => e
        
      logger.error "Error: #{e}"
  
    end
  end

end