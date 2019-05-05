ActiveRecord::Schema.define(version: 2019_04_30_192113) do

  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.bigint "lib_id", null: false
    t.text "name", null: false
    t.text "author"
    t.string "code", limit: 100, null: false
    t.text "publisher"
    t.decimal "year", precision: 38
    t.decimal "price", precision: 10, scale: 2
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lib_id"], name: "index_books_on_lib_id"
  end

  create_table "libs", force: :cascade do |t|
    t.string "number", limit: 100, null: false
    t.text "name", null: false
    t.text "adress", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readers", force: :cascade do |t|
    t.bigint "lib_id"
    t.decimal "number", precision: 38, null: false
    t.string "lastname", limit: 100, null: false
    t.string "firstname", limit: 100, null: false
    t.string "fathername", limit: 100
    t.text "adress", null: false
    t.decimal "phone", precision: 38, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lib_id"], name: "index_readers_on_lib_id"
  end

  create_table "servs", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "reader_id", null: false
    t.date "start", null: false
    t.date "finish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_servs_on_book_id"
    t.index ["reader_id"], name: "index_servs_on_reader_id"
  end

  create_table "workers", force: :cascade do |t|
    t.bigint "lib_id", null: false
    t.string "lastname", limit: 100, null: false
    t.string "firstname", limit: 100, null: false
    t.string "fathername", limit: 100
    t.date "birthday"
    t.date "workdate"
    t.text "position", null: false
    t.string "education", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lib_id"], name: "index_workers_on_lib_id"
  end

  add_foreign_key "books", "libs"
  add_foreign_key "readers", "libs"
  add_foreign_key "servs", "books"
  add_foreign_key "servs", "readers"
  add_foreign_key "workers", "libs"
end
