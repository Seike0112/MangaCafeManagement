class OwnerShowController < ApplicationController

  before_action :jwt_auth

  # 開発者情報閲覧
  def index
    begin 

      owner = Owner.find_by(id: @jwt_data[:ownid])
      render json: {owner: owner}

    rescue => e
        
      logger.error "Error: #{e}"
  
    end
  end

end