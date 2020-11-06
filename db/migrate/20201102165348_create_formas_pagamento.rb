# frozen_string_literal: true

class CreateFormasPagamento < ActiveRecord::Migration[6.0]
  def change
    create_table :formas_pagamento do |t|
      t.string :nome, uniquess: true, null: false
      t.boolean :ativo, null: false, default: true
      t.string :observacao

      t.timestamps
    end
  end
end
