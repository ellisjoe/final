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

ActiveRecord::Schema.define(version: 0) do

  create_table "comments", force: :cascade do |t|
    t.datetime "time_posted"
    t.string   "content"
    t.integer  "group_member_id"
  end

  add_index "comments", ["group_member_id"], name: "index_comments_on_group_member_id"

  create_table "group_members", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  add_index "group_members", ["group_id"], name: "index_group_members_on_group_id"
  add_index "group_members", ["user_id"], name: "index_group_members_on_user_id"

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "description"
  end

  create_table "pictures", force: :cascade do |t|
    t.string   "caption"
    t.datetime "time_posted"
    t.string   "file_location"
    t.integer  "group_member_id"
  end

  add_index "pictures", ["group_member_id"], name: "index_pictures_on_group_member_id"

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.datetime "time_posted"
    t.string   "content"
    t.integer  "group_member_id"
  end

  add_index "posts", ["group_member_id"], name: "index_posts_on_group_member_id"

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
  end

end
