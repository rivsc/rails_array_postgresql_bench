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

ActiveRecord::Schema.define(version: 20170328123832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bidules", force: :cascade do |t|
    t.integer  "liste_gin_ids",   default: [],              array: true
    t.integer  "liste_btree_ids", default: [],              array: true
    t.integer  "liste_none_ids",  default: [],              array: true
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.index ["liste_btree_ids"], name: "index_bidules_on_liste_btree_ids", using: :btree
    t.index ["liste_gin_ids"], name: "index_bidules_on_liste_gin_ids", using: :gin
  end

end
