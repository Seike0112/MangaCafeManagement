class OwnerShowController < ApplicationController

  before_action :jwt

  # 開発者情報閲覧
  def index

    begin 


      owner = Owner.find_by(id: @jwt_data[:ownid])
      puts "問い合わせ先：　#{owner.own_email}"

    rescue => e
        
      logger.error "Error: #{e}"
  
    end

  end

end