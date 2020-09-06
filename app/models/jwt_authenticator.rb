module JwtAuthenticator
  require 'jwt'

  SECRET_KEY_BASE = ENV['SECRET_KEY_BASE']

  def jwt_auth
    render json: {err_msg: '承認情報が不足しています。'} and return if request.headers['Authorization'].blank?
    encode_token = request.headers['Authorization'].split('Token ').last
    data = decode(encoded_token).symbolize_keys
    render json: {err_msg:  "認証できません。"} and return if data == true

    case 
    when data[:ownid]
      @jwt_data = {
        ownid: data[:ownid],
        own_email: data[:own_email],
      }
      debugger
    end
    render json: {err_msg: "認証できません。"} and return if @jwt_data.blank?
    @jwt_data
  end

  # 暗号化処理
  def owner_encode(owner)
    expires_in = 1.month.from_now.to_i # 再ログインを必要とするまでの期間を１ヶ月とした場合
    preload = { 
      ownid: owner.id, 
      owner_email: owner.own_email,
      exp: expires_in,
    }
    JWT.encode(preload, SECRET_KEY_BASE, 'HS256')
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