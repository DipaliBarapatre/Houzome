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

ActiveRecord::Schema.define(version: 20150824065215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.string   "name"
    t.integer  "builder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_id"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.text     "address"
  end

  create_table "builders", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "contact"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image_id"
  end

  create_table "designs", force: :cascade do |t|
    t.string   "name"
    t.string   "master_image_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "floor_plan_id",                                         array: true
    t.string   "slug"
    t.text     "description"
    t.decimal  "selling_price",   precision: 15, scale: 5
    t.text     "specifications"
  end

  add_index "designs", ["floor_plan_id"], name: "index_designs_on_floor_plan_id", using: :gin
  add_index "designs", ["slug"], name: "index_designs_on_slug", unique: true, using: :btree

  create_table "designs_flats", id: false, force: :cascade do |t|
    t.integer "design_id", null: false
    t.integer "flat_id",   null: false
  end

  add_index "designs_flats", ["design_id", "flat_id"], name: "index_designs_flats_on_design_id_and_flat_id", using: :btree
  add_index "designs_flats", ["flat_id", "design_id"], name: "index_designs_flats_on_flat_id_and_design_id", using: :btree

  create_table "flats", force: :cascade do |t|
    t.text     "numbers",       default: [],              array: true
    t.string   "floor_plan_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "fp_id"
  end

  create_table "flats_towers", id: false, force: :cascade do |t|
    t.integer "flat_id",  null: false
    t.integer "tower_id", null: false
  end

  add_index "flats_towers", ["flat_id", "tower_id"], name: "index_flats_towers_on_flat_id_and_tower_id", using: :btree
  add_index "flats_towers", ["tower_id", "flat_id"], name: "index_flats_towers_on_tower_id_and_flat_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "file_id"
    t.integer  "design_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["design_id"], name: "index_images_on_design_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "name"
    t.string   "mobile"
    t.string   "email"
    t.string   "aasm_state"
    t.text     "apartment_address"
    t.string   "flat"
    t.string   "city"
    t.text     "special_request"
    t.string   "number"
    t.string   "order_type"
    t.integer  "apartment_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "design_id"
    t.date     "edd"
    t.decimal  "price",             precision: 8, scale: 2
  end

  add_index "orders", ["apartment_id"], name: "index_orders_on_apartment_id", using: :btree
  add_index "orders", ["design_id"], name: "index_orders_on_design_id", using: :btree

  create_table "towers", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "apartment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "towers", ["apartment_id"], name: "index_towers_on_apartment_id", using: :btree

  add_foreign_key "images", "designs"
  add_foreign_key "orders", "apartments"
  add_foreign_key "orders", "designs"
  add_foreign_key "towers", "apartments"
end
