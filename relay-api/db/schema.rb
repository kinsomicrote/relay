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

ActiveRecord::Schema.define(version: 2019_02_26_101559) do

  create_table "strongbolt_capabilities", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "model"
    t.string "action"
    t.string "attr"
    t.boolean "require_ownership", default: false, null: false
    t.boolean "require_tenant_access", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "strongbolt_capabilities_roles", force: :cascade do |t|
    t.integer "role_id"
    t.integer "capability_id"
    t.index ["capability_id"], name: "index_strongbolt_capabilities_roles_on_capability_id"
    t.index ["role_id"], name: "index_strongbolt_capabilities_roles_on_role_id"
  end

  create_table "strongbolt_roles", force: :cascade do |t|
    t.string "name"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["lft"], name: "index_strongbolt_roles_on_lft"
    t.index ["parent_id"], name: "index_strongbolt_roles_on_parent_id"
    t.index ["rgt"], name: "index_strongbolt_roles_on_rgt"
  end

  create_table "strongbolt_roles_user_groups", force: :cascade do |t|
    t.integer "user_group_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_strongbolt_roles_user_groups_on_role_id"
    t.index ["user_group_id"], name: "index_strongbolt_roles_user_groups_on_user_group_id"
  end

  create_table "strongbolt_user_groups", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "strongbolt_user_groups_users", force: :cascade do |t|
    t.integer "user_group_id"
    t.integer "user_id"
    t.index ["user_group_id", "user_id"], name: "index_strongbolt_user_groups_users_unique", unique: true
    t.index ["user_group_id"], name: "index_strongbolt_user_groups_users_on_user_group_id"
    t.index ["user_id"], name: "index_strongbolt_user_groups_users_on_user_id"
  end

  create_table "strongbolt_users_tenants", force: :cascade do |t|
    t.integer "user_id"
    t.integer "tenant_id"
    t.string "type"
    t.index ["tenant_id", "type"], name: "index_strongbolt_users_tenants_on_tenant_id_and_type"
    t.index ["tenant_id"], name: "index_strongbolt_users_tenants_on_tenant_id"
    t.index ["type"], name: "index_strongbolt_users_tenants_on_type"
    t.index ["user_id"], name: "index_strongbolt_users_tenants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
