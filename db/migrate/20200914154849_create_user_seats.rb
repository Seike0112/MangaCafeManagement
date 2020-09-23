class CreateUserSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :user_seats do |t|
      t.string :us_price
      t.string :usse_price_change
      t.string :total_price
      t.float :tax, scale: 2, default: 1.08
      t.datetime :start
      t.datetime :end
      t.string :usetime
      t.boolean :bill_judge
      t.boolean :usse_use_status
      t.string :booth_price
      t.string :booth_type
      t.string :order_price
      t.string :order_number
      t.integer :seat_id
      t.references :booth, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
