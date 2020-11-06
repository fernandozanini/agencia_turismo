# frozen_string_literal: true

class CreateEmpresas < ActiveRecord::Migration[6.0]
  def change
    create_table :empresas do |t|
      t.string :nome, uniquess: true, null: false
      t.boolean :ativo, null: false, default: true
      t.string :observacao

      t.timestamps
    end
  end
end
