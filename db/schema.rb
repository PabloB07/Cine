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

ActiveRecord::Schema.define(version: 2021_04_14_175536) do

  create_table "assistants", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "movie_id", null: false
    t.string "name"
    t.text "message"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_assistants_on_movie_id"
    t.index ["user_id"], name: "index_assistants_on_user_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "movie"
    t.text "description"
    t.integer "movies"
    t.integer "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies_users", id: false, force: :cascade do |t|
    t.integer "movie_id", null: false
    t.integer "user_id", null: false
    t.integer "movies_id", null: false
    t.integer "users_id", null: false
    t.index ["movies_id"], name: "index_movies_users_on_movies_id"
    t.index ["users_id"], name: "index_movies_users_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.integer "age"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "assistants", "movies"
  add_foreign_key "assistants", "users"
  add_foreign_key "movies_users", "movies", column: "movies_id"
  add_foreign_key "movies_users", "users", column: "users_id"
end
