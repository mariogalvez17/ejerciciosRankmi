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

ActiveRecord::Schema.define(version: 20160506204000) do

  create_table "applications", force: :cascade do |t|
    t.text     "nombre"
    t.text     "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoria", force: :cascade do |t|
    t.text     "nombre"
    t.text     "descripcion"
    t.float    "valor"
    t.integer  "padre_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade do |t|
    t.text     "nombre"
    t.text     "descripcion"
    t.float    "valor"
    t.integer  "padre_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories", ["padre_id"], name: "index_categories_on_padre_id"

  create_table "clientes", force: :cascade do |t|
    t.text     "ip"
    t.text     "browser"
    t.text     "system"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "application_id"
  end

  add_index "clientes", ["application_id"], name: "index_clientes_on_application_id"

  create_table "eventos", force: :cascade do |t|
    t.text     "nombre"
    t.text     "params"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cliente_id"
    t.datetime "hora"
  end

  add_index "eventos", ["cliente_id"], name: "index_eventos_on_cliente_id"

  create_table "hijos", force: :cascade do |t|
    t.text     "nombre"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
  end

  add_index "hijos", ["category_id"], name: "index_hijos_on_category_id"

  create_table "padres", force: :cascade do |t|
    t.text     "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
