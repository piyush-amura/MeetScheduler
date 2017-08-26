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

ActiveRecord::Schema.define(version: 20170826113038) do

  create_table "agendas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "mom_id", null: false
    t.string "name", null: false
    t.integer "allocated_time", default: 30, null: false
    t.string "action", null: false
    t.string "status", default: "approval needed", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mom_id"], name: "index_agendas_on_mom_id"
  end

  create_table "meetings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "date", null: false
    t.time "start_time", null: false
    t.string "status", default: "on time"
    t.text "key_note", null: false
    t.float "duration", limit: 24
    t.bigint "organiser_id"
    t.bigint "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organiser_id"], name: "index_meetings_on_organiser_id"
    t.index ["venue_id"], name: "index_meetings_on_venue_id"
  end

  create_table "meetings_users", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "user_id"
    t.bigint "meeting_id"
    t.index ["meeting_id"], name: "index_meetings_users_on_meeting_id"
    t.index ["user_id"], name: "index_meetings_users_on_user_id"
  end

  create_table "moms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.text "summary", null: false
    t.bigint "meeting_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meeting_id"], name: "index_moms_on_meeting_id"
  end

  create_table "suggestions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "user_id", null: false
    t.bigint "agenda_id", null: false
    t.text "suggestion", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["agenda_id"], name: "index_suggestions_on_agenda_id"
    t.index ["user_id", "agenda_id"], name: "index_suggestions_on_user_id_and_agenda_id"
    t.index ["user_id"], name: "index_suggestions_on_user_id"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", null: false
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", null: false
    t.text "address", null: false
    t.integer "capacity", default: 10, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "available"
  end

  add_foreign_key "agendas", "moms"
  add_foreign_key "meetings", "users", column: "organiser_id"
  add_foreign_key "meetings", "venues"
  add_foreign_key "meetings_users", "meetings"
  add_foreign_key "meetings_users", "users"
  add_foreign_key "moms", "meetings"
  add_foreign_key "suggestions", "agendas"
  add_foreign_key "suggestions", "users"
end
