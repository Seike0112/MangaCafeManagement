# ver1.0.0 / create_Developer
module JwtAuthenticator
  require "jwt"

  SECRET_KEY_BASE = ENV['SECRET_KEY_BASE']

  def jwt_auth
    begin

      render json: {err_msg: '承認情報が不足しています。'} and return if request.headers['Authorization'].blank?
      encoded_token = request.headers['Authorization']
      data = decode(encoded_token).symbolize_keys
      render json: {err_msg:  "認証できません。"} and return if data == true
      case 
      when data[:ownid]
        @jwt_data = {
          ownid: data[:ownid],
          own_email: data[:own_email],
          owner_judge: data[:owner_judge],
        }
      when data[:adid]
        @jwt_data = {
          adid: data[:adid],
          ad_email: data[:ad_email],
          admin_judge: data[:admin_judge],
          own_id: data[:own_id],
        }
      end
      render json: {err_msg: "認証できません。"} and return if @jwt_data.blank?

    rescue => e

      logger.error "Error: #{e}"
    end
  end

  # 暗号化処理
  def owner_encode(owner)
    expires_in = 6.month.from_now.to_i # 再ログインを必要とするまでの期間を１ヶ月とした場合
    payload = { 
      ownid: owner.id, 
      own_email: owner.own_email,
      owner_judge: owner.owner_judge,
      exp: expires_in,
    }
    JWT.encode(payload, SECRET_KEY_BASE, 'HS256')
  end

  def admin_encode(admin)
    expires_in = 6.month.from_now.to_i # 再ログインを必要とするまでの期間を１ヶ月とした場合
    payload = { 
      adid: admin.id, 
      ad_email: admin.ad_email,
      admin_judge: admin.admin_judge,
      own_id: admin.owner_id,
      exp: expires_in,
    }
    JWT.encode(payload, SECRET_KEY_BASE, 'HS256')
  end

  def decode(encoded_token)
    begin
      decoded_dwt = JWT.decode(encoded_token, SECRET_KEY_BASE, true, algorithm: 'HS256')
      decoded_dwt.first
    rescue => e
      logger.error "Error: #{e}"
    end
  end

end