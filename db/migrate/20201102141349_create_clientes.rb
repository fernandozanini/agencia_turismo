# frozen_string_literal: true

class CreateClientes < ActiveRecord::Migration[6.0]
  def change
    create_table :clientes do |t|
      t.string :nome, null: false
      t.string :observacao

      t.timestamps
    end
  end
end
