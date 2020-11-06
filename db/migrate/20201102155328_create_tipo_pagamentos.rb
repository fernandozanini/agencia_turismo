# frozen_string_literal: true

class CreateTipoPagamentos < ActiveRecord::Migration[6.0]
  def change
    create_table :tipo_pagamentos do |t|
      t.string :nome, uniquess: true, null: false
      t.boolean :ativo, null: false, default: true
      t.string :observacao

      t.timestamps
    end
  end
end
