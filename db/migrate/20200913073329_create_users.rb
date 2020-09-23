class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :us_full_name
      t.string :us_email
      t.string :password_digest
      t.string :us_kana
      t.string :us_price
      t.string :us_job
      t.string :us_age
      t.string :us_sex
      t.string :us_phone
      t.string :us_address
      t.string :us_post_number
      t.string :us_store_id
      t.references :admin, foreign_key: true

      t.timestamps
    end
  end
end
