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

ActiveRecord::Schema.define(:version => 20131008090125) do

  create_table "books", :force => true do |t|
    t.string   "title"
    t.string   "short_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "food_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "food_items", :force => true do |t|
    t.integer  "shopping_list_id"
    t.integer  "food_id"
    t.string   "quantity"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "foods", :force => true do |t|
    t.string   "name"
    t.integer  "food_group_id"
    t.string   "preferred_unit"
    t.integer  "millilitres"
    t.integer  "grams"
    t.string   "item_description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "ingredients", :force => true do |t|
    t.string   "unit"
    t.decimal  "quantity",             :precision => 10, :scale => 3
    t.integer  "food_id"
    t.integer  "recipe_id"
    t.datetime "created_at",                                          :null => false
    t.datetime "updated_at",                                          :null => false
    t.string   "description"
    t.string   "quantity_description"
  end

  create_table "menu_items", :force => true do |t|
    t.integer  "recipe_id"
    t.integer  "menu_id"
    t.date     "having"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "menus", :force => true do |t|
    t.date     "start_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "other_items", :force => true do |t|
    t.integer  "shopping_list_id"
    t.integer  "shopping_item_id"
    t.integer  "quantity"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "recipes", :force => true do |t|
    t.string   "name"
    t.text     "method"
    t.string   "page"
    t.integer  "preparation_time"
    t.integer  "total_time"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "book_id"
  end

  create_table "shopping_items", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "shopping_lists", :force => true do |t|
    t.integer  "menu_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
