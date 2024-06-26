# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_29_002153) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "vector"

  create_table "book_embeddings", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.vector "embedding", limit: 1024
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_book_embeddings_on_book_id", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "series"
    t.string "author"
    t.text "description"
    t.string "language"
    t.string "isbn"
    t.integer "page"
    t.date "publish_date"
    t.string "cover_url"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["isbn"], name: "index_books_on_isbn", unique: true
  end

  create_table "books_genres", id: false, force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "genre_id", null: false
    t.index ["book_id", "genre_id"], name: "index_books_genres_on_book_id_and_genre_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "book_embeddings", "books"
end
