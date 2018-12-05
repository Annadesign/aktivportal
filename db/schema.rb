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

ActiveRecord::Schema.define(version: 20181205132515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.text "content"
    t.string "image"
    t.boolean "publish"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "image"
    t.string "ancestry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "event_tags", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_event_tags_on_event_id"
    t.index ["tag_id"], name: "index_event_tags_on_tag_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.text "content"
    t.datetime "date"
    t.string "lng"
    t.string "lat"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "publish"
    t.string "image"
    t.string "location"
    t.bigint "category_id"
    t.bigint "organization_id"
    t.index ["category_id"], name: "index_events_on_category_id"
    t.index ["organization_id"], name: "index_events_on_organization_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "image"
    t.bigint "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_images_on_event_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "contactperson"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "title"
    t.string "apiurl"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "apikey"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "promote"
  end

  create_table "users", force: :cascade do |t|
    t.string "fullname"
    t.string "username"
    t.string "telephone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "articles", "users"
  add_foreign_key "event_tags", "events"
  add_foreign_key "event_tags", "tags"
  add_foreign_key "events", "categories"
  add_foreign_key "events", "organizations"
  add_foreign_key "events", "users"
  add_foreign_key "images", "events"
end
