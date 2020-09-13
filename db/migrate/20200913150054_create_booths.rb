class CreateBooths < ActiveRecord::Migration[6.0]
  def change
    create_table :booths do |t|
      t.string :bo_name
      t.string :bo_type
      t.string :bo_price
      t.string :bo_remarks
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
