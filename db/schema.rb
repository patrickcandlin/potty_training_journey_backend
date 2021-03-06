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

ActiveRecord::Schema.define(version: 2020_03_17_042020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caregivers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "child_caregivers", force: :cascade do |t|
    t.bigint "caregiver_id", null: false
    t.bigint "child_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["caregiver_id"], name: "index_child_caregivers_on_caregiver_id"
    t.index ["child_id"], name: "index_child_caregivers_on_child_id"
  end

  create_table "children", force: :cascade do |t|
    t.string "name"
    t.date "birthday"
    t.string "secret"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "potties", force: :cascade do |t|
    t.string "excreation_type"
    t.datetime "time"
    t.bigint "child_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "notes"
    t.boolean "on_potty"
    t.index ["child_id"], name: "index_potties_on_child_id"
  end

  add_foreign_key "child_caregivers", "caregivers"
  add_foreign_key "child_caregivers", "children"
  add_foreign_key "potties", "children"
end
