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

ActiveRecord::Schema.define(version: 2020_09_13_150054) do

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

  create_table "booths", force: :cascade do |t|
    t.string "bo_name"
    t.string "bo_type"
    t.string "bo_price"
    t.string "bo_remarks"
    t.integer "admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_booths_on_admin_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "own_name"
    t.string "own_email"
    t.string "password_digest"
    t.boolean "owner_judge"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "us_full_name"
    t.string "us_email"
    t.string "password_digest"
    t.string "us_kana"
    t.string "us_job"
    t.string "us_age"
    t.string "us_sex"
    t.string "us_phone"
    t.string "us_address"
    t.string "us_post_number"
    t.string "us_store_id"
    t.integer "admin_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["admin_id"], name: "index_users_on_admin_id"
  end

  add_foreign_key "admins", "owners"
  add_foreign_key "booths", "admins"
  add_foreign_key "users", "admins"
end
