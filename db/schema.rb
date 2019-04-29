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

ActiveRecord::Schema.define(version: 2019_04_29_203350) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "libs", force: :cascade do |t|
    t.string "number"
    t.text "name"
    t.text "adress"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readers", force: :cascade do |t|
    t.integer "number"
    t.string "lastname"
    t.string "firstname"
    t.string "fathername"
    t.text "adress"
    t.integer "phone"
    t.bigint "lib_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lib_id"], name: "index_readers_on_lib_id"
  end

  create_table "workers", force: :cascade do |t|
    t.string "lastname"
    t.string "firstname"
    t.string "fathername"
    t.date "birthday"
    t.date "workdate"
    t.text "position"
    t.text "education"
    t.bigint "lib_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lib_id"], name: "index_workers_on_lib_id"
  end

  add_foreign_key "readers", "libs"
  add_foreign_key "workers", "libs"
end