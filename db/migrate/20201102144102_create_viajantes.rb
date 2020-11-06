# frozen_string_literal: true

class CreateViajantes < ActiveRecord::Migration[6.0]
  def change
    create_table :viajantes do |t|
      t.string :nome, null: false
      t.string :rg
      t.string :cpf, uniquess: true
      t.date :data_nascimento, null: false
      t.string :passaporte

      t.timestamps
    end
  end
end
