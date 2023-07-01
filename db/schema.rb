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

ActiveRecord::Schema[7.0].define(version: 2023_07_01_184600) do
  create_table "usuarios", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "tipo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "viagems", force: :cascade do |t|
    t.string "local_partida"
    t.string "local_chegada"
    t.date "data_partida"
    t.date "data_chegada"
    t.time "horario_partida"
    t.time "horario_chegada"
    t.string "tipo"
    t.integer "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_viagems_on_usuario_id"
  end

  add_foreign_key "viagems", "usuarios"
end
