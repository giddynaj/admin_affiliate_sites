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

ActiveRecord::Schema.define(version: 20160329233314) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "client_versions", force: :cascade do |t|
    t.integer  "client_id",   limit: 4
    t.datetime "updated_at",              null: false
    t.datetime "created_at",              null: false
    t.string   "description", limit: 255
  end

  add_index "client_versions", ["client_id"], name: "index_client_versions_on_client_id", using: :btree
  add_index "client_versions", ["description"], name: "index_description", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "base_url",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "visitor_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "event_type", limit: 45
    t.string   "data",       limit: 255
  end

  create_table "form_field_groups", force: :cascade do |t|
    t.string "description", limit: 45
  end

  create_table "form_field_memberships", force: :cascade do |t|
    t.integer "form_field_group_id", limit: 4, null: false
    t.integer "form_field_id",       limit: 4
    t.integer "field_order",         limit: 4
  end

  create_table "form_field_validation_memberships", force: :cascade do |t|
    t.integer "form_field_id",            limit: 4, null: false
    t.integer "form_field_validation_id", limit: 4, null: false
    t.integer "validation_order",         limit: 4
  end

  create_table "form_field_validations", force: :cascade do |t|
    t.string "description", limit: 255
    t.string "name",        limit: 45
    t.string "value",       limit: 255
  end

  create_table "form_fields", force: :cascade do |t|
    t.string  "description",      limit: 255
    t.string  "html_type",        limit: 45
    t.string  "name",             limit: 45
    t.string  "label",            limit: 255
    t.string  "placeholder",      limit: 45
    t.string  "default_value",    limit: 45
    t.integer "options_group_id", limit: 4
  end

  create_table "form_submissions", force: :cascade do |t|
    t.integer "visitor_id", limit: 4
    t.text    "data",       limit: 65535
  end

  create_table "options_groups", force: :cascade do |t|
    t.integer "group_id", limit: 4
    t.string  "value",    limit: 155
  end

  create_table "stages", force: :cascade do |t|
    t.string  "name",                limit: 255
    t.integer "client_id",           limit: 4
    t.integer "client_version_id",   limit: 4
    t.string  "layout_name",         limit: 255
    t.integer "sequence",            limit: 4
    t.integer "form_field_group_id", limit: 4
  end

  create_table "states", force: :cascade do |t|
    t.string "state_abbr", limit: 2
    t.string "state_full", limit: 30
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visitor_properties", force: :cascade do |t|
    t.integer  "visitor_id", limit: 4,  null: false
    t.string   "key",        limit: 45
    t.string   "value",      limit: 45
    t.datetime "created_at"
  end

  add_index "visitor_properties", ["key"], name: "key_index", using: :btree
  add_index "visitor_properties", ["visitor_id"], name: "visitor_index", using: :btree

  create_table "visitors", force: :cascade do |t|
    t.string   "uri",               limit: 255
    t.string   "ip",                limit: 255
    t.string   "user_agent",        limit: 255
    t.string   "referer",           limit: 255
    t.datetime "created_at",                    null: false
    t.integer  "context_id",        limit: 4
    t.string   "client",            limit: 255
    t.integer  "client_version_id", limit: 4
    t.integer  "client_id",         limit: 4
    t.datetime "updated_at",                    null: false
  end

  create_table "visits", force: :cascade do |t|
    t.integer  "visitor_id",  limit: 4
    t.integer  "stage_id",    limit: 4
    t.datetime "datetime_ts"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "zip_codes", force: :cascade do |t|
    t.string   "zip",        limit: 5,  null: false
    t.string   "city",       limit: 30
    t.string   "state",      limit: 2
    t.float    "latitude",   limit: 24
    t.float    "longitude",  limit: 24
    t.string   "zip_class",  limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "zip_codes", ["longitude"], name: "long_zip", using: :btree
  add_index "zip_codes", ["state"], name: "state", using: :btree
  add_index "zip_codes", ["zip"], name: "index_zip_codes_on_zip", unique: true, using: :btree

  add_foreign_key "client_versions", "clients"
end
