class CreateOwners < ActiveRecord::Migration[6.0]
  def change
    create_table :owners do |t|
      t.string :own_email
      t.string :own_password

      t.timestamps
    end
  end
end
