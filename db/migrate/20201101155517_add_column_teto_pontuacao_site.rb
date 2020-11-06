# frozen_string_literal: true

class AddColumnTetoPontuacaoSite < ActiveRecord::Migration[6.0]
  def change
    add_column :sites, :teto_pontuacao, :integer
  end
end
