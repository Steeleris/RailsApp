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

ActiveRecord::Schema.define(version: 20150201193112) do

  create_table "assignments", force: :cascade do |t|
    t.integer  "zombie_id",  limit: 4
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "assignments", ["role_id"], name: "index_assignments_on_role_id", using: :btree
  add_index "assignments", ["zombie_id"], name: "index_assignments_on_zombie_id", using: :btree

  create_table "brains", force: :cascade do |t|
    t.integer  "zombie_id",  limit: 4
    t.string   "status",     limit: 255
    t.string   "flavor",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.integer  "zombie_id",  limit: 4
    t.string   "text",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "topic",      limit: 255
  end

  create_table "zombies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "bio",        limit: 65535
    t.integer  "age",        limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "email",      limit: 255
    t.boolean  "rotting",    limit: 1,     default: false
  end

end
