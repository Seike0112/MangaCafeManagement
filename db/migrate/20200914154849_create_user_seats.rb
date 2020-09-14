class CreateUserSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :user_seats do |t|
      t.datetime :start
      t.datetime :end
      t.time :usetime
      t.boolean :judge
      t.string :booth_price
      t.string :booth_type
      t.string :order_price
      t.string :order_number
      t.references :booth, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
