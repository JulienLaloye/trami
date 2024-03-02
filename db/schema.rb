# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_03_02_133332) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "title"
    t.bigint "mood_id", null: false
    t.string "category"
    t.text "interests", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mood_id"], name: "index_activities_on_mood_id"
  end

  create_table "appointments", force: :cascade do |t|
    t.integer "status", default: 0
    t.boolean "ownership"
    t.bigint "user_id", null: false
    t.bigint "room_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "presence", default: false
    t.index ["room_id"], name: "index_appointments_on_room_id"
    t.index ["user_id"], name: "index_appointments_on_user_id"
  end

  create_table "avatars", force: :cascade do |t|
    t.string "personality"
    t.string "picture"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moods", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "category"
    t.string "picture"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rankings", force: :cascade do |t|
    t.string "name"
    t.integer "threshold"
    t.string "picture"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "reporter_id"
    t.integer "reportee_id"
    t.string "reason"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "appointment_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "feedbacks", default: [], array: true
    t.index ["appointment_id"], name: "index_reviews_on_appointment_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "gender"
    t.datetime "date"
    t.integer "max_part"
    t.integer "min_part"
    t.string "address"
    t.string "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "activity_id", null: false
    t.bigint "user_id", null: false
    t.boolean "finished", default: false
    t.float "latitude"
    t.float "longitude"
    t.integer "min_age"
    t.integer "max_age"
    t.integer "participants", default: 1
    t.index ["activity_id"], name: "index_rooms_on_activity_id"
    t.index ["user_id"], name: "index_rooms_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nationality"
    t.string "gender"
    t.date "birthdate"
    t.string "description"
    t.string "address"
    t.text "interests", default: [], array: true
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "mood_id", null: false
    t.bigint "ranking_id", null: false
    t.bigint "avatar_id", null: false
    t.float "latitude"
    t.float "longitude"
    t.string "username"
    t.index ["avatar_id"], name: "index_users_on_avatar_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["mood_id"], name: "index_users_on_mood_id"
    t.index ["ranking_id"], name: "index_users_on_ranking_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "activities", "moods"
  add_foreign_key "appointments", "rooms"
  add_foreign_key "appointments", "users"
  add_foreign_key "reports", "users", column: "reportee_id"
  add_foreign_key "reports", "users", column: "reportee_id"
  add_foreign_key "reports", "users", column: "reporter_id"
  add_foreign_key "reports", "users", column: "reporter_id"
  add_foreign_key "reviews", "appointments"
  add_foreign_key "reviews", "users"
  add_foreign_key "rooms", "activities"
  add_foreign_key "rooms", "users"
  add_foreign_key "users", "avatars"
  add_foreign_key "users", "moods"
  add_foreign_key "users", "rankings"
end
