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

ActiveRecord::Schema.define(:version => 20100725080939) do

  create_table "catalogs", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.string   "name",         :limit => 30
    t.string   "comment_type", :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "complects", :force => true do |t|
    t.string   "title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "catalog_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "price"
    t.boolean  "on_main"
    t.string   "composition"
    t.string   "first_color"
    t.string   "second_color"
    t.string   "size"
  end

  create_table "contents", :force => true do |t|
    t.string   "title"
    t.string   "keywords"
    t.string   "description"
    t.text     "text"
    t.integer  "parent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uri"
  end

  create_table "orders", :force => true do |t|
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string   "title"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "complect_id"
  end

  create_table "products", :force => true do |t|
    t.string   "title"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "composition"
    t.string   "first_color"
    t.string   "second_color"
    t.string   "size"
    t.integer  "complect_id"
  end

  create_table "reviews", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", :force => true do |t|
    t.string   "title"
    t.string   "name"
    t.string   "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statistics", :force => true do |t|
    t.date    "date"
    t.string  "ip"
    t.integer "count"
    t.string  "user_agent"
  end

  create_table "topics", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.text     "text"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "name"
    t.string   "email"
    t.string   "group"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
