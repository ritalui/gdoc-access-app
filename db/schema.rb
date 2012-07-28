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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120728030232) do

  create_table "assignments", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "provider_auths", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.string   "access_token"
    t.string   "refresh_token"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "submitted_works", :force => true do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.string   "file_name"
    t.text     "file_text"
    t.string   "submitted_link"
    t.string   "provider"
    t.integer  "reviewer_id"
    t.text     "review_comments"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "submittedworks", :force => true do |t|
    t.integer  "user_id"
    t.integer  "assignment_id"
    t.string   "file_name"
    t.text     "file_text"
    t.string   "submitted_link"
    t.string   "provider"
    t.integer  "reviewer_id"
    t.text     "review_comments"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "isAdmin",         :default => false
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
  end

end
