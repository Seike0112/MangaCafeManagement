class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.string :se_name
      t.boolean :se_use_status
      t.references :booth, null: false, foreign_key: true

      t.timestamps
    end
  end
end
