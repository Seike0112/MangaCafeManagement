# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_06_160542) do

  create_table "admins", force: :cascade do |t|
    t.string "ad_name"
    t.string "ad_email"
    t.string "password_digest"
    t.string "ad_description"
    t.boolean "admin_judge"
    t.integer "owner_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_id"], name: "index_admins_on_owner_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "own_name"
    t.string "own_email"
    t.string "password_digest"
    t.boolean "owner_judge"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "admins", "owners"
end
