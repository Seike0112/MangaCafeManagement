class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :ad_name
      t.string :ad_email
      t.string :password_digest
      t.string :ad_description
      t.boolean :admin_judge
      t.references :owner, foreign_key: true

      t.timestamps
    end
  end
end
