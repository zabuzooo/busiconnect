# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180722021800) do

  create_table "matchings", force: :cascade do |t|
    t.string "matching_message"
    t.boolean "matching_flag"
    t.integer "user_id"
    t.integer "need_id"
    t.integer "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "matching_s", default: 0
  end

  create_table "needs", force: :cascade do |t|
    t.string "need_title"
    t.text "need_text"
    t.date "match_time"
    t.string "place"
    t.boolean "delete_flag"
    t.integer "matching_id"
    t.integer "user_id"
    t.integer "status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "place_field_id"
    t.string "need_number"
    t.integer "purpose_id"
  end

  create_table "place_fields", force: :cascade do |t|
    t.string "place"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "place_m"
  end

  create_table "purposes", force: :cascade do |t|
    t.string "purpose_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "settlements", force: :cascade do |t|
    t.string "settlement_account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "matching_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "type_industry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unsubscribe_comments", force: :cascade do |t|
    t.text "comment"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "user_name"
    t.string "user_phonetic"
    t.string "postal"
    t.string "address"
    t.string "tell"
    t.boolean "delete_flag", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "place_field_id"
    t.string "anuual"
    t.string "employment"
    t.string "pr"
    t.integer "settlement_id"
    t.integer "type_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
