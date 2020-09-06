class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :ad_email
      t.string :ad_password
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
