# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151209074007) do

  create_table "calendars", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "departments", ["organization_id"], name: "index_departments_on_organization_id"

  create_table "employees", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "employee_number"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.date     "hire_date",       default: '2015-12-09'
    t.date     "removal_date"
    t.string   "password_digest"
    t.string   "type",            default: "Employee"
    t.boolean  "omniauth"
    t.integer  "department_id"
    t.integer  "organization_id"
  end

  add_index "employees", ["department_id"], name: "index_employees_on_department_id"
  add_index "employees", ["organization_id"], name: "index_employees_on_organization_id"

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer  "employee_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "department_id"
  end

  add_index "schedules", ["department_id"], name: "index_schedules_on_department_id"
  add_index "schedules", ["employee_id"], name: "index_schedules_on_employee_id"

  create_table "shifts", force: :cascade do |t|
    t.string   "shift_description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "schedule_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "shifts", ["schedule_id"], name: "index_shifts_on_schedule_id"

end
