# 開発者用アカウント作成
Owner.create!(
  own_name: '清家　叶多',
  own_email: 'seike.112@icloud.com',
  password: 'password',
  owner_judge: true,
)
puts '開発者用アカウントを作成しました。'

Admin.create!(
  ad_name: '快活クラブ大森店',
  ad_email: 'siten_omori@kaikatsu.com',
  password: 'password',
  admin_judge: true,
  owner_id: 1
)
puts '快活用大森支店アカウントを作成しました。'

User.create!(
  us_full_name: '田中　太郎',
  us_email: 'taro@email.com',
  password: 'password',
  us_kana: 'たなか　たろう',
  us_job: '会社員',
  us_age: '25',
  us_sex: '男',
  us_phone: '000-0000-0000',
  us_address: '東京都品川区南大井',
  us_post_number: '000-0000',
  admin_id: 1
)
puts 'ユーザーアカウントを作成しました。'

Booth.create!(
  bo_name: 'ビリヤードブース',
  bo_type: '喫煙席',
  bo_price: '120',
  bo_remarks: 'マッセ等の危険行為は禁止します。',
  admin_id: 1,
)
Booth.create!(
  bo_name: 'ダーツブース',
  bo_type: '標準席',
  bo_price: '120',
  bo_remarks: '遠投はおやめください。',
  admin_id: 1,
)
Booth.create!(
  bo_name: '個室ブース',
  bo_type: 'フラット席',
  bo_price: '110',
  bo_remarks: '座席とフラット席と選べます。',
  admin_id: 1,
)
puts 'ブースを作成しました。'

Seat.create!(
  se_name: 'ビリヤードブース',
  se_use_status: false,
  booth_id: 1,
)
Seat.create!(
  se_name: 'ダーツブース',
  se_use_status: false,
  booth_id: 2,
)
Seat.create!(
  se_name: '個室ブース',
  se_use_status: false,
  booth_id: 3,
)
puts 'シートを作成しました。'

UserSeat.create!(
  id: 1,
  start: "2020-09-20T13:30:33.000+09:00",
  bill_judge: false,
  usse_use_status: false,
  booth_price: "450",
  booth_type: "喫煙席",
  seat_id: 1,
  booth_id: 1,
  user_id: 1,
)
puts '受付サービスを作成しました。'