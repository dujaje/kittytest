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

ActiveRecord::Schema.define(version: 20171130155530) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "expenses", force: :cascade do |t|
    t.bigint "group_id"
    t.bigint "user_id"
    t.string "title"
    t.integer "amount_cents", default: 0
    t.string "split_type", default: "equal"
    t.boolean "settled", default: false
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["group_id"], name: "index_expenses_on_group_id"
    t.index ["user_id"], name: "index_expenses_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "tid"
    t.integer "global_tid"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "kitty_created", default: false
    t.string "thread_type"
  end

  create_table "memberships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_memberships_on_group_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "splits", force: :cascade do |t|
    t.bigint "expense_id"
    t.bigint "user_id"
    t.integer "amount_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "paid", default: false
    t.index ["expense_id"], name: "index_splits_on_expense_id"
    t.index ["user_id"], name: "index_splits_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "psid"
    t.integer "fb_id"
    t.string "first_name"
    t.string "last_name"
    t.string "profile_picture_url"
    t.string "address"
    t.integer "timezone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "first_sign_in", default: true
  end

  add_foreign_key "expenses", "groups"
  add_foreign_key "expenses", "users"
  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "users"
  add_foreign_key "splits", "expenses"
  add_foreign_key "splits", "users"
end
