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

ActiveRecord::Schema.define(version: 2019_11_20_145925) do

  create_table "budget_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "budget_plan_id", null: false
    t.decimal "amount", precision: 16, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["budget_plan_id", "category_id"], name: "index_budget_details_on_budget_plan_id_and_category_id", unique: true
    t.index ["budget_plan_id"], name: "index_budget_details_on_budget_plan_id"
    t.index ["category_id"], name: "index_budget_details_on_category_id"
  end

  create_table "budget_plans", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.date "plan_date", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "plan_date"], name: "index_budget_plans_on_user_id_and_plan_date", unique: true
    t.index ["user_id"], name: "index_budget_plans_on_user_id"
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "category", limit: 24, null: false
    t.string "short_desc", limit: 64, null: false
    t.string "full_desc"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category"], name: "index_categories_on_category", unique: true
  end

  create_table "expenses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "details", null: false
    t.decimal "amount", precision: 16, scale: 2, null: false
    t.bigint "category_id", null: false
    t.bigint "budget_plan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["budget_plan_id"], name: "index_expenses_on_budget_plan_id"
    t.index ["category_id"], name: "index_expenses_on_category_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "f_name", limit: 20, null: false
    t.string "l_name", limit: 60, null: false
    t.string "email", limit: 80, null: false
    t.string "user_name", limit: 30, null: false
    t.string "password_digest", null: false
    t.boolean "admin", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

  add_foreign_key "budget_details", "budget_plans"
  add_foreign_key "budget_details", "categories"
  add_foreign_key "budget_plans", "users"
  add_foreign_key "expenses", "budget_plans"
  add_foreign_key "expenses", "categories"
end
