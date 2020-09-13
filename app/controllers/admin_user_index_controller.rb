class AdminUserIndexController < ApplicationController

  before_action :jwt_auth

  # 開発者情報閲覧
  def index
    begin 

      admin = Admin.find_by(id: @jwt_data[:adid])
      users = User.all
      if users.present?
        render json: {users: users}
      else
        render json: {err_msg: "該当する店舗が見つかりませんでした。"}
      end

    rescue => e
        
      logger.error "Error: #{e}"
  
    end
  end

end