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

ActiveRecord::Schema.define(version: 2022_02_21_044647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "master_salon_services", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_master_salon_services_on_name", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "customer_id"
    t.bigint "salon_service_id"
    t.decimal "price", precision: 6, scale: 2, null: false
    t.datetime "start_time", null: false
    t.integer "duration", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_reservations_on_customer_id"
    t.index ["salon_service_id"], name: "index_reservations_on_salon_service_id"
  end

  create_table "salon_owners", force: :cascade do |t|
    t.bigint "salon_id"
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["salon_id"], name: "index_salon_owners_on_salon_id"
  end

  create_table "salon_services", force: :cascade do |t|
    t.bigint "salon_id"
    t.bigint "service_id"
    t.integer "duration", null: false
    t.decimal "price", precision: 6, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["salon_id", "service_id"], name: "index_salon_services_on_salon_id_and_service_id", unique: true
    t.index ["salon_id"], name: "index_salon_services_on_salon_id"
    t.index ["service_id"], name: "index_salon_services_on_service_id"
  end

  create_table "salons", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "gstin", null: false
    t.string "pan", null: false
    t.text "address", null: false
    t.time "start_time", null: false
    t.time "end_time", null: false
    t.integer "chairs", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["gstin"], name: "index_salons_on_gstin", unique: true
    t.index ["name"], name: "index_salons_on_name", unique: true
    t.index ["pan"], name: "index_salons_on_pan", unique: true
    t.index ["slug"], name: "index_salons_on_slug", unique: true
  end

  add_foreign_key "reservations", "customers", on_delete: :cascade
  add_foreign_key "reservations", "salon_services", on_delete: :restrict
  add_foreign_key "salon_owners", "salons", on_delete: :cascade
  add_foreign_key "salon_services", "master_salon_services", column: "service_id", on_delete: :restrict
  add_foreign_key "salon_services", "salons", on_delete: :cascade
end
