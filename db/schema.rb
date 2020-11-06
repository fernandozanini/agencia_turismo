# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_02_175756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "nome", null: false
    t.string "observacao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "empresas", force: :cascade do |t|
    t.string "nome", null: false
    t.boolean "ativo", default: true, null: false
    t.string "observacao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "formas_pagamento", force: :cascade do |t|
    t.string "nome", null: false
    t.boolean "ativo", default: true, null: false
    t.string "observacao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string "nome"
    t.string "url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "codigo"
    t.integer "teto_pontuacao"
  end

  create_table "tipo_pagamentos", force: :cascade do |t|
    t.string "nome", null: false
    t.boolean "ativo", default: true, null: false
    t.string "observacao"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tipos_venda", force: :cascade do |t|
    t.string "nome", null: false
    t.boolean "ativo", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vendas", force: :cascade do |t|
    t.date "data_venda", null: false
    t.bigint "cliente_id", null: false
    t.bigint "tipo_venda_id", null: false
    t.date "data_utilizacao", null: false
    t.bigint "empresa_id", null: false
    t.bigint "tipo_pagamento_id", null: false
    t.string "localizador"
    t.bigint "viajante_id", null: false
    t.bigint "forma_pagamento_id", null: false
    t.integer "qtd_parcelas"
    t.decimal "custo"
    t.decimal "venda"
    t.decimal "lucro"
    t.decimal "lucro_porcentagem"
    t.date "data_recebimento"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cliente_id"], name: "index_vendas_on_cliente_id"
    t.index ["empresa_id"], name: "index_vendas_on_empresa_id"
    t.index ["forma_pagamento_id"], name: "index_vendas_on_forma_pagamento_id"
    t.index ["tipo_pagamento_id"], name: "index_vendas_on_tipo_pagamento_id"
    t.index ["tipo_venda_id"], name: "index_vendas_on_tipo_venda_id"
    t.index ["viajante_id"], name: "index_vendas_on_viajante_id"
  end

  create_table "viajantes", force: :cascade do |t|
    t.string "nome", null: false
    t.string "rg"
    t.string "cpf"
    t.date "data_nascimento", null: false
    t.string "passaporte"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "vendas", "clientes"
  add_foreign_key "vendas", "empresas"
  add_foreign_key "vendas", "formas_pagamento"
  add_foreign_key "vendas", "tipo_pagamentos"
  add_foreign_key "vendas", "tipos_venda"
  add_foreign_key "vendas", "viajantes"
end
