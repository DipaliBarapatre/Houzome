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

ActiveRecord::Schema.define(version: 20150819114305) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartments", force: :cascade do |t|
    t.string   "name"
    t.integer  "builder_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "image_id"
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
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "floor_plan_id",                array: true
  end

  add_index "designs", ["floor_plan_id"], name: "index_designs_on_floor_plan_id", using: :gin

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

  create_table "towers", force: :cascade do |t|
    t.string   "name",         null: false
    t.integer  "apartment_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "towers", ["apartment_id"], name: "index_towers_on_apartment_id", using: :btree

  add_foreign_key "images", "designs"
  add_foreign_key "towers", "apartments"
end
