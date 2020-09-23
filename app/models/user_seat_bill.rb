module UserSeatBill

  def bill(user, booth, seat, user_seat)
    begin

    # user_user_seat_delete_controllerから引数にて利用情報を受け継ぐ
    user = user
    booth = booth
    seat = seat
    user_seat = user_seat

    user_seat.update!({
      end: I18n.l(DateTime.now, format: :default),
      usse_use_status: false
    })

    # シートの利用状況をfalseにする
    seat.update!({
      se_use_status: false
    })

    # 利用時間の算出
    service_use_time = ((user_seat.end - user_seat.start) / 60 / 10)

    # 最小単位の利用時間チェック
    render json: {err_msg: ["利用時間が最小の単位（１０分あたり、#{booth.bo_price}円）未満になりますので、終了受付をできません。"]} and return if service_use_time < 1

    # 総合サービス料金の算出
    tax_included_price = ((booth.bo_price).to_i * user_seat.tax).to_i
    total_price = (service_use_time * tax_included_price * user_seat.tax).to_i

    # ユーザー側の金額入力チェック
    render json: {err_msg: ["金額を指定して下さい。"]} and return if params[:us_price].blank?

    # 精算・お釣りの算出
    usse_price_change = ((params[:us_price]).to_i - total_price).to_i
    debugger
    #　支払いのチェック
    render json: {err_msg: ["支払額が不足しています。不足額：　#{usse_price_change.sub(/[^0-9]/, "")}"]} and return if usse_price_change < 0

    user_seat.update!({
      bill_judge: true,
      usetime: service_use_time,
      total_price: total_price,
      us_price: params[:us_price],
      usse_price_change: usse_price_change,
    })

    render json: {bill_create_msg: [
      "会員No.#{user.id}\n
      #{user.us_full_name}様、本日は当店の#{booth.bo_name}をご利用頂き誠にありがとうございました。\n
      また次回のご来店をお待ちしております。\n

      -------------------------------------------------------------------------------------------------------------

      【ご精算内容】\n
      ご利用ブース：　#{booth.bo_name}\n
      入店時刻：　#{I18n.l(user_seat.start, format: :default)}　\n
      退店時刻：　#{I18n.l(user_seat.end, format: :default)}
      滞在時間：　#{((user_seat.end - user_seat.start) / 60).to_i}分 \n

      -------------------------------------------------------------------------------------------------------------

      小計： ¥#{((booth.bo_price).to_i * service_use_time).to_i}　\n
      合計： ¥#{total_price} \n
      お預かり：　¥#{user_seat.us_price} \n
      釣銭：　¥#{user_seat.usse_price_change} \n"
      ]}

    rescue => e

      logger.error "Error: #{e}"

    end
  end

end