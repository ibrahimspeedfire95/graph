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

ActiveRecord::Schema.define(version: 20170606152628) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "tutor_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "student_id"
    t.index ["student_id"], name: "index_courses_on_student_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "name"
    t.string "material_type"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "price"
    t.integer "material_type_enum"
    t.index ["course_id"], name: "index_materials_on_course_id"
    t.index ["price"], name: "index_materials_on_price"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "email"
  end

  create_table "user_session_data", force: :cascade do |t|
    t.string "platform", null: false
    t.string "notifications_token", default: "", null: false
    t.bigint "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_user_session_data_on_student_id"
  end

  add_foreign_key "courses", "students"
  add_foreign_key "materials", "courses"
end
