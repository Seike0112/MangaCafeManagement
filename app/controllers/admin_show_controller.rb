class AdminShowController < ApplicationController

  before_action :jwt_auth

  def index
    begin

      admin = Admin.find_by(id: @jwt_data[:adid])
      render json: {admin: admin}

    rescue => e
        
      logger.error "Error: #{e}"
  
    end
  end

end