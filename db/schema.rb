# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150211110944) do

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "faq_translations", force: true do |t|
    t.integer  "faq_id",     null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "source"
  end

  add_index "faq_translations", ["faq_id"], name: "index_faq_translations_on_faq_id"
  add_index "faq_translations", ["locale"], name: "index_faq_translations_on_locale"

  create_table "faqs", force: true do |t|
  end

  create_table "marker_group_translations", force: true do |t|
    t.integer  "marker_group_id", null: false
    t.string   "locale",          null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "marker_group_translations", ["locale"], name: "index_marker_group_translations_on_locale"
  add_index "marker_group_translations", ["marker_group_id"], name: "index_marker_group_translations_on_marker_group_id"

  create_table "marker_groups", force: true do |t|
    t.string   "color"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marker_translations", force: true do |t|
    t.integer  "marker_id",  null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  add_index "marker_translations", ["locale"], name: "index_marker_translations_on_locale"
  add_index "marker_translations", ["marker_id"], name: "index_marker_translations_on_marker_id"

  create_table "markers", force: true do |t|
    t.string   "latitude"
    t.string   "longitude"
    t.string   "address"
    t.string   "icon"
    t.integer  "marker_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city",            default: ""
  end

  add_index "markers", ["marker_group_id"], name: "index_markers_on_marker_group_id"

  create_table "media_partners", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "logo"
    t.string   "url"
  end

  create_table "news", force: true do |t|
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_on_mine", default: true
    t.date     "date"
    t.string   "slug",         default: ""
  end

  add_index "news", ["slug"], name: "index_news_on_slug", unique: true

  create_table "news_translations", force: true do |t|
    t.integer  "news_id",       null: false
    t.string   "locale",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "short"
    t.text     "body"
    t.string   "title_on_mine"
    t.string   "short_on_mine"
  end

  add_index "news_translations", ["locale"], name: "index_news_translations_on_locale"
  add_index "news_translations", ["news_id"], name: "index_news_translations_on_news_id"

  create_table "partner_translations", force: true do |t|
    t.integer  "partner_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "body"
  end

  add_index "partner_translations", ["locale"], name: "index_partner_translations_on_locale"
  add_index "partner_translations", ["partner_id"], name: "index_partner_translations_on_partner_id"

  create_table "partners", force: true do |t|
    t.string   "logo_color"
    t.string   "logo_black_and_white"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "video"
  end

  create_table "project_translations", force: true do |t|
    t.integer  "project_id", null: false
    t.string   "locale",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.text     "short"
    t.text     "body"
  end

  add_index "project_translations", ["locale"], name: "index_project_translations_on_locale"
  add_index "project_translations", ["project_id"], name: "index_project_translations_on_project_id"

  create_table "projects", force: true do |t|
    t.string   "image"
    t.string   "status"
    t.boolean  "is_show"
    t.integer  "weight",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       default: "", null: false
    t.string   "big_image"
    t.string   "file_link"
  end

  add_index "projects", ["slug"], name: "index_projects_on_slug", unique: true

  create_table "publication_translations", force: true do |t|
    t.integer  "publication_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "source"
  end

  add_index "publication_translations", ["locale"], name: "index_publication_translations_on_locale"
  add_index "publication_translations", ["publication_id"], name: "index_publication_translations_on_publication_id"

  create_table "publications", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
    t.string   "source_link"
    t.date     "date"
  end

  create_table "static_page_translations", force: true do |t|
    t.integer  "static_page_id", null: false
    t.string   "locale",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vision_title"
    t.text     "vision_text"
    t.text     "values_text"
    t.text     "tasks_text"
  end

  add_index "static_page_translations", ["locale"], name: "index_static_page_translations_on_locale"
  add_index "static_page_translations", ["static_page_id"], name: "index_static_page_translations_on_static_page_id"

  create_table "static_pages", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
