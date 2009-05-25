# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090228125323) do

  create_table "about_comms", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "email"
    t.string   "author"
    t.string   "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "abouts", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.string   "author"
    t.string   "admin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "cl_name"
    t.text     "cl_desc"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.string   "author"
    t.text     "content"
    t.integer  "idea_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "reset_password_code"
  end

  create_table "events", :force => true do |t|
    t.string   "ev_title"
    t.text     "ev_desc"
    t.string   "ev_author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "idea_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ideas", :force => true do |t|
    t.string   "author"
    t.string   "title"
    t.text     "content"
    t.integer  "idea_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partners", :force => true do |t|
    t.string   "pa_name"
    t.text     "pa_desc"
    t.string   "pa_url"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_comments", :force => true do |t|
    t.text     "sc_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_types", :force => true do |t|
    t.string   "st_name"
    t.text     "st_desc"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "services", :force => true do |t|
    t.string   "sl_title"
    t.text     "sl_content"
    t.string   "sl_author"
    t.integer  "sl_year"
    t.integer  "service_type_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solution_types", :force => true do |t|
    t.string   "st_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "solutions", :force => true do |t|
    t.string   "so_title"
    t.text     "so_content"
    t.string   "so_author"
    t.integer  "solution_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
