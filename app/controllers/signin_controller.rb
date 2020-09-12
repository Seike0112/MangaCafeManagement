# ver1.0.0 / create_Developer
class SigninController < ApplicationController

def info
  begin

    jwt_token = ""

    case
    when params[:own_email]
      owner = Owner.find_by(own_email: params[:own_email])
      jwt_token = owner_encode(owner) if owner&.authenticate(params[:password])
    end
    
    if jwt_token.present?
      render json: {fl_msg: "ログインしました。", token: jwt_token}
    else
      render json: {err_msg: "メールまたはパスワードが誤っています。"}
    end

  rescue => e
        
    logger.error "Error: #{e}"

  end

end

end