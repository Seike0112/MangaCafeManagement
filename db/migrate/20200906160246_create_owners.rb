class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :own_name
      t.string :own_email
      t.string :password_digest
      t.boolean :owner_judge

      t.timestamps
    end
  end
end
