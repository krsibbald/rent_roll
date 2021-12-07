# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_12_07_024953) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "residents", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stays", force: :cascade do |t|
    t.date "move_in"
    t.date "move_out"
    t.bigint "unit_id", null: false
    t.bigint "resident_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["resident_id"], name: "index_stays_on_resident_id"
    t.index ["unit_id"], name: "index_stays_on_unit_id"
  end

  create_table "units", force: :cascade do |t|
    t.integer "number"
    t.string "floor_plan"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["number"], name: "index_units_on_number", unique: true
  end

  add_foreign_key "stays", "residents"
  add_foreign_key "stays", "units"
end
