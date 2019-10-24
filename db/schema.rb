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

ActiveRecord::Schema.define(version: 2019_10_24_204135) do

  create_table "character_gears", force: :cascade do |t|
    t.integer "character_id"
    t.integer "gear_id"
    t.index ["character_id"], name: "index_character_gears_on_character_id"
    t.index ["gear_id"], name: "index_character_gears_on_gear_id"
  end

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.text "origin"
    t.text "winning_text"
    t.integer "attack_power"
    t.integer "health"
  end

  create_table "encounters", force: :cascade do |t|
    t.string "setting"
    t.integer "villain_id"
    t.integer "character_id"
    t.index ["character_id"], name: "index_encounters_on_character_id"
    t.index ["villain_id"], name: "index_encounters_on_villain_id"
  end

  create_table "gears", force: :cascade do |t|
    t.string "name"
    t.integer "damage"
    t.integer "add_health"
  end

  create_table "user_choices", force: :cascade do |t|
    t.integer "encounter_id"
    t.integer "character_gear_id"
    t.integer "villain_gear_id"
    t.index ["character_gear_id"], name: "index_user_choices_on_character_gear_id"
    t.index ["encounter_id"], name: "index_user_choices_on_encounter_id"
    t.index ["villain_gear_id"], name: "index_user_choices_on_villain_gear_id"
  end

  create_table "villain_gears", force: :cascade do |t|
    t.integer "villain_id"
    t.integer "gear_id"
    t.index ["gear_id"], name: "index_villain_gears_on_gear_id"
    t.index ["villain_id"], name: "index_villain_gears_on_villain_id"
  end

  create_table "villains", force: :cascade do |t|
    t.string "name"
    t.integer "attack_power"
    t.integer "health"
    t.text "winning_text"
  end

  add_foreign_key "character_gears", "characters"
  add_foreign_key "character_gears", "gears"
  add_foreign_key "encounters", "characters"
  add_foreign_key "encounters", "villains"
  add_foreign_key "user_choices", "character_gears"
  add_foreign_key "user_choices", "encounters"
  add_foreign_key "user_choices", "villain_gears"
  add_foreign_key "villain_gears", "gears"
  add_foreign_key "villain_gears", "villains"
end
