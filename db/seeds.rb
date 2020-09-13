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