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

ActiveRecord::Schema.define(version: 2021_08_09_042140) do

  create_table "mst_source_of_funds", id: :integer, charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", limit: 100, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "FK1 user_id FK1 sys_users id"
  end

  create_table "sys_audit_trails", id: :integer, charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "name", limit: 100, default: "0", null: false
    t.string "path_name", limit: 200, default: "0", null: false
    t.string "status", limit: 50, default: "0", null: false
    t.string "message", limit: 200, default: "0", null: false
  end

  create_table "sys_users", id: :integer, charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "username", limit: 50, null: false
    t.string "email", limit: 50, null: false
    t.string "salt", limit: 50, null: false
    t.string "password", limit: 100, null: false
    t.string "name", limit: 200, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trx_income", id: :integer, charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "source_of_fund_id", default: 0, null: false
    t.integer "user_id", default: 0, null: false
    t.float "nominal", default: 0.0, null: false
    t.datetime "created_at", default: -> { "current_timestamp()" }, null: false
    t.datetime "updated_at", default: -> { "current_timestamp()" }, null: false
    t.index ["source_of_fund_id"], name: "FK1 source_of_fund_id FK1 mst_source_of_funds id"
    t.index ["user_id"], name: "FK2 user_id FK2 sys_users id"
  end

  create_table "trx_spending", id: :integer, charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "source_of_fund_id", null: false
    t.integer "user_id", null: false
    t.float "nominal", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_of_fund_id"], name: "FK1 source_of_fund_id FK 1 mst_source_of_funds id"
    t.index ["user_id"], name: "FK1 user_id FK1 sys_users id"
  end

  create_table "trx_user_balance", id: :integer, charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "user_id", null: false
    t.float "balance", null: false
    t.integer "source_of_fund", null: false
    t.datetime "created_at", default: -> { "current_timestamp()" }, null: false
    t.datetime "updated_at", default: -> { "current_timestamp()" }, null: false
    t.index ["user_id"], name: "FK1 user_id FK1 sys_users id"
  end

  create_table "trx_user_balance_logs", id: :integer, charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "source_of_fund", null: false
    t.float "balance", null: false
    t.datetime "created_at", default: -> { "current_timestamp()" }
    t.datetime "updated_at", default: -> { "current_timestamp()" }
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
