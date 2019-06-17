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

ActiveRecord::Schema.define(version: 20190614021742) do

  create_table "organizations", primary_key: "_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "url"
    t.string   "external_id"
    t.string   "name"
    t.string   "domain_names"
    t.datetime "created_at"
    t.string   "details"
    t.boolean  "shared_tickets"
    t.string   "tags"
    t.datetime "updated_at"
  end

  create_table "tickets", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "_id",                           null: false
    t.string   "url"
    t.string   "external_id"
    t.datetime "created_at"
    t.string   "type"
    t.string   "subject"
    t.text     "description",     limit: 65535
    t.string   "priority"
    t.string   "status"
    t.string   "submitter_id"
    t.string   "assignee_id"
    t.integer  "organization_id"
    t.string   "tags"
    t.boolean  "has_incidents"
    t.datetime "due_at"
    t.string   "via"
    t.datetime "updated_at"
    t.index ["_id"], name: "index_tickets_on__id", unique: true, using: :btree
    t.index ["assignee_id"], name: "index_tickets_on_assignee_id", using: :btree
    t.index ["organization_id"], name: "index_tickets_on_organization_id", using: :btree
    t.index ["submitter_id"], name: "index_tickets_on_submitter_id", using: :btree
  end

  create_table "users", primary_key: "_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci" do |t|
    t.string   "url"
    t.string   "external_id"
    t.string   "name"
    t.string   "alias"
    t.datetime "created_at"
    t.boolean  "active"
    t.boolean  "verified"
    t.boolean  "shared"
    t.string   "locale"
    t.string   "timezone"
    t.datetime "last_login_at"
    t.string   "email",           default: ""
    t.string   "phone"
    t.string   "signature",       default: "Don't Worry Be Happy!"
    t.integer  "organization_id"
    t.string   "tags"
    t.boolean  "suspended"
    t.string   "role"
    t.datetime "updated_at"
    t.index ["organization_id"], name: "index_users_on_organization_id", using: :btree
  end

end
