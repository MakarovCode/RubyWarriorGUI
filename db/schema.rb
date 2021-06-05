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

ActiveRecord::Schema.define(version: 2015_05_17_220915) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_id", null: false
    t.string "resource_type", null: false
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
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
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "show_in_menu"
    t.string "image"
  end

  create_table "category_tutorials", force: :cascade do |t|
    t.string "version"
    t.bigint "category_id"
    t.bigint "tutorial_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_category_tutorials_on_category_id"
    t.index ["tutorial_id"], name: "index_category_tutorials_on_tutorial_id"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.integer "assetable_id"
    t.string "assetable_type", limit: 30
    t.string "type", limit: 30
    t.integer "width"
    t.integer "height"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
    t.index ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"
  end

  create_table "pages", force: :cascade do |t|
    t.text "content"
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "tutorial_id"
    t.index ["tutorial_id"], name: "index_pages_on_tutorial_id"
  end

  create_table "rubywarrior_player_towers", force: :cascade do |t|
    t.integer "time"
    t.integer "score"
    t.integer "difficulty"
    t.boolean "clear"
    t.bigint "rubywarrior_tower_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rubywarrior_player_id"
    t.string "file_path"
    t.index ["rubywarrior_player_id"], name: "index_rubywarrior_player_towers_on_rubywarrior_player_id"
    t.index ["rubywarrior_tower_id"], name: "index_rubywarrior_player_towers_on_rubywarrior_tower_id"
  end

  create_table "rubywarrior_players", force: :cascade do |t|
    t.string "name"
    t.integer "actual_level"
    t.integer "actual_difficulty"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_rubywarrior_players_on_user_id"
  end

  create_table "rubywarrior_tower_units", force: :cascade do |t|
    t.string "name"
    t.integer "pos_y"
    t.integer "direction"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "rubywarrior_tower_id"
    t.integer "pos_x"
    t.index ["rubywarrior_tower_id"], name: "index_rubywarrior_tower_units_on_rubywarrior_tower_id"
  end

  create_table "rubywarrior_tower_warriors", force: :cascade do |t|
    t.integer "pos_x"
    t.integer "pos_y"
    t.integer "direction"
    t.text "habilities"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "rubywarrior_towers", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.text "tip"
    t.text "clue"
    t.integer "time_bonus"
    t.integer "ace_score"
    t.integer "size_width"
    t.integer "size_height"
    t.integer "stairs_x"
    t.integer "stairs_y"
    t.bigint "rubywarrior_tower_warrior_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rubywarrior_tower_warrior_id"], name: "index_rubywarrior_towers_on_rubywarrior_tower_warrior_id"
  end

  create_table "scores", force: :cascade do |t|
    t.float "value"
    t.bigint "user_id"
    t.bigint "tutorial_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tutorial_id"], name: "index_scores_on_tutorial_id"
    t.index ["user_id"], name: "index_scores_on_user_id"
  end

  create_table "tutorial_comments", force: :cascade do |t|
    t.text "description"
    t.bigint "user_id"
    t.bigint "tutorial_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tutorial_id"], name: "index_tutorial_comments_on_tutorial_id"
    t.index ["user_id"], name: "index_tutorial_comments_on_user_id"
  end

  create_table "tutorials", force: :cascade do |t|
    t.string "title"
    t.float "score"
    t.integer "visits_count"
    t.integer "number_of_pages"
    t.string "version"
    t.text "objective"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_tutorials_on_category_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "gender"
    t.string "username"
    t.string "country"
    t.string "profession"
    t.text "why"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
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
    t.datetime "confirmed_at"
    t.string "confirmation_token"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  add_foreign_key "rubywarrior_players", "users"
end
