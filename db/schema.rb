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

ActiveRecord::Schema.define(version: 2021_05_15_155523) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flower_shops", force: :cascade do |t|
    t.string "name"
    t.integer "rating"
    t.boolean "same_day_delivery"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flowers", force: :cascade do |t|
    t.string "species"
    t.integer "shelf_life"
    t.boolean "in_stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gardens", force: :cascade do |t|
    t.string "name"
    t.boolean "water_on"
    t.integer "water_access_pts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "plots", force: :cascade do |t|
    t.string "name"
    t.boolean "available"
    t.string "sun_coverage"
    t.integer "square_ft"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "garden_id"
    t.index ["garden_id"], name: "index_plots_on_garden_id"
  end

  add_foreign_key "plots", "gardens"
end
