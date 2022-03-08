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

ActiveRecord::Schema.define(version: 20201223120851) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "about_us", force: :cascade do |t|
    t.string "title", null: false
    t.text "static_body", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "action_logs", force: :cascade do |t|
    t.string "action"
    t.integer "admin_id"
    t.string "loggable_type"
    t.integer "loggable_id"
    t.text "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "pass_changed"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "superadmin", default: false
    t.string "image"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "capacity_venues", force: :cascade do |t|
    t.string "name"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "venue_id"
    t.index ["venue_id"], name: "index_capacity_venues_on_venue_id"
  end

  create_table "contact_infos", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "email"
    t.string "phone"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "oib"
    t.string "mb"
    t.string "iban"
    t.string "image"
  end

  create_table "contact_message_reads", force: :cascade do |t|
    t.integer "admin_id"
    t.integer "contact_message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contact_messages", force: :cascade do |t|
    t.string "email"
    t.string "full_name"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_images", force: :cascade do |t|
    t.string "image"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
    t.index ["event_id"], name: "index_event_images_on_event_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "image"
    t.string "headline", null: false
    t.date "start_date"
    t.date "end_date"
    t.time "starting_at"
    t.string "event_type", null: false
    t.string "text"
    t.boolean "starred", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "brief"
    t.string "price"
  end

  create_table "events_tags", id: false, force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "tag_id"
    t.index ["event_id"], name: "index_events_tags_on_event_id"
    t.index ["tag_id"], name: "index_events_tags_on_tag_id"
  end

  create_table "home_static_texts", force: :cascade do |t|
    t.string "title"
    t.text "static_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
  end

  create_table "legals", force: :cascade do |t|
    t.text "gdpr"
    t.text "impresum"
    t.text "privacy_policy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.string "favicon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "news_article_images", force: :cascade do |t|
    t.string "image"
    t.bigint "news_article_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["news_article_id"], name: "index_news_article_images_on_news_article_id"
  end

  create_table "news_articles", force: :cascade do |t|
    t.string "image"
    t.string "headline"
    t.text "text"
    t.string "news_type"
    t.boolean "starred"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "brief"
    t.date "publish_date"
  end

  create_table "news_articles_tags", force: :cascade do |t|
    t.bigint "news_article_id"
    t.bigint "tag_id"
    t.index ["news_article_id"], name: "index_news_articles_tags_on_news_article_id"
    t.index ["tag_id"], name: "index_news_articles_tags_on_tag_id"
  end

  create_table "post_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "public_procurements", force: :cascade do |t|
    t.string "title"
    t.string "link"
    t.integer "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "resource_permissions", force: :cascade do |t|
    t.integer "admin_id"
    t.string "resource"
    t.boolean "permitted", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_networks", force: :cascade do |t|
    t.string "name"
    t.string "favicon", null: false
    t.string "url", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "starred"
  end

  create_table "team_images", force: :cascade do |t|
    t.string "image"
    t.bigint "team_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_images_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "role"
    t.string "name", null: false
    t.text "bio", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tinymce_pictures", force: :cascade do |t|
    t.string "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "venue_images", force: :cascade do |t|
    t.string "image"
    t.bigint "venue_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_id"], name: "index_venue_images_on_venue_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "position"
  end

  add_foreign_key "capacity_venues", "venues"
  add_foreign_key "event_images", "events"
  add_foreign_key "events_tags", "events"
  add_foreign_key "events_tags", "tags"
  add_foreign_key "news_article_images", "news_articles"
  add_foreign_key "news_articles_tags", "news_articles"
  add_foreign_key "news_articles_tags", "tags"
  add_foreign_key "team_images", "teams"
  add_foreign_key "venue_images", "venues"
end
