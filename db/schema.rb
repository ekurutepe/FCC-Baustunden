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

ActiveRecord::Schema.define(version: 20150304114312) do

  create_table "project_admins", id: false, force: true do |t|
    t.integer "user_id",    null: false
    t.integer "project_id", null: false
  end

  add_index "project_admins", ["user_id", "project_id"], name: "index_project_admins_on_user_id_and_project_id"

  create_table "projects", force: true do |t|
    t.string   "name"
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

  create_table "workunits", force: true do |t|
    t.date     "performed_at"
    t.decimal  "duration"
    t.datetime "confirmed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "performed_by_user_id"
    t.integer  "confirmed_by_user_id"
    t.integer  "project_id"
    t.string   "description"
  end

  add_index "workunits", ["confirmed_by_user_id"], name: "index_workunits_on_confirmed_by_user_id"
  add_index "workunits", ["performed_by_user_id"], name: "index_workunits_on_performed_by_user_id"
  add_index "workunits", ["project_id"], name: "index_workunits_on_project_id"

end