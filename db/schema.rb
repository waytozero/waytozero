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

ActiveRecord::Schema.define(version: 2019_11_12_132845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievement_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_achievement_categories_on_category_id"
  end

  create_table "achievement_numbers", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenges", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "intensity"
    t.boolean "map", default: false
    t.integer "gender_specific", default: 0
    t.integer "plastic"
    t.boolean "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "category_id"
    t.index ["category_id"], name: "index_challenges_on_category_id"
  end

  create_table "successes", force: :cascade do |t|
    t.string "achievement_type"
    t.bigint "achievement_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["achievement_type", "achievement_id"], name: "index_successes_on_achievement_type_and_achievement_id"
    t.index ["user_id"], name: "index_successes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "weekly_challenges", force: :cascade do |t|
    t.integer "week"
    t.integer "year"
    t.boolean "status_challenge", default: false
    t.bigint "challenge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["challenge_id"], name: "index_weekly_challenges_on_challenge_id"
    t.index ["user_id"], name: "index_weekly_challenges_on_user_id"
  end

  add_foreign_key "achievement_categories", "categories"
  add_foreign_key "challenges", "categories"
  add_foreign_key "successes", "users"
  add_foreign_key "weekly_challenges", "challenges"
  add_foreign_key "weekly_challenges", "users"
end
