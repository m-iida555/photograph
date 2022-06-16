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

ActiveRecord::Schema.define(version: 2022_05_29_110444) do

  create_table "models", force: :cascade do |t|
    t.text "model_image"
    t.string "model_job"
    t.string "model_hobby"
    t.string "model_comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "girl_name"
    t.text "model_image_sub"
  end

  create_table "schedule_models", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "schedule_id"
    t.integer "model_id"
    t.index ["model_id"], name: "index_schedule_models_on_model_id"
    t.index ["schedule_id"], name: "index_schedule_models_on_schedule_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.datetime "start_time"
    t.string "name"
    t.string "place"
    t.string "explain"
    t.text "place_image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "place_d", default: 0
  end

  create_table "user_schedules", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.integer "schedule_id", null: false
    t.index ["schedule_id"], name: "index_user_schedules_on_schedule_id"
    t.index ["user_id"], name: "index_user_schedules_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.integer "birth_year"
    t.integer "birth_month"
    t.integer "birth_day"
    t.integer "telephone"
    t.text "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.text "background_image"
    t.string "remember_digest"
    t.date "birth_date"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "schedule_models", "models"
  add_foreign_key "schedule_models", "schedules"
  add_foreign_key "user_schedules", "schedules"
  add_foreign_key "user_schedules", "users"
end
