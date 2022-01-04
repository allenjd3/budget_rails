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

ActiveRecord::Schema.define(version: 2022_01_04_015850) do

  create_table "categories", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.bigint "month_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["month_id"], name: "index_categories_on_month_id"
  end

  create_table "items", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.integer "planned"
    t.integer "remaining"
    t.boolean "is_fund"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "months", charset: "utf8mb3", force: :cascade do |t|
    t.date "month"
    t.integer "monthly_planned_cents", default: 0, null: false
    t.string "monthly_planned_currency", default: "USD", null: false
    t.bigint "team_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_months_on_team_id"
  end

  create_table "teams", charset: "utf8mb3", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "teams_users", id: false, charset: "utf8mb3", force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "user_id", null: false
    t.index ["user_id", "team_id"], name: "index_teams_users_on_user_id_and_team_id", unique: true
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "months"
  add_foreign_key "items", "categories"
  add_foreign_key "months", "teams"
end
