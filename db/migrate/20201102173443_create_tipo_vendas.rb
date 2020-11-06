# frozen_string_literal: true

class CreateTipoVendas < ActiveRecord::Migration[6.0]
  def change
    create_table :tipos_venda do |t|
      t.string :nome, uniquess: true, null: false
      t.boolean :ativo, null: false, default: true

      t.timestamps
    end
  end
end
