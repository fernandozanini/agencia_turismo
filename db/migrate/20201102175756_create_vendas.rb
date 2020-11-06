# frozen_string_literal: true

class CreateVendas < ActiveRecord::Migration[6.0]
  def change
    create_table :vendas do |t|
      t.date :data_venda, null: false
      t.references :cliente, null: false, foreign_key: true
      t.references :tipo_venda, null: false, foreign_key: true
      t.date :data_utilizacao, null: false
      t.references :empresa, null: false, foreign_key: true
      t.references :tipo_pagamento, null: false, foreign_key: true
      t.string :localizador
      t.references :viajante, null: false, foreign_key: true
      t.references :forma_pagamento, null: false, foreign_key: true
      t.integer :qtd_parcelas
      t.decimal :custo
      t.decimal :venda
      t.decimal :lucro
      t.decimal :lucro_porcentagem
      t.date :data_recebimento
      t.integer :status

      t.timestamps
    end
  end
end
