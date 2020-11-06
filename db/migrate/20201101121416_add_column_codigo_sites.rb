# frozen_string_literal: true

class AddColumnCodigoSites < ActiveRecord::Migration[6.0]
  def change
    add_column :sites, :codigo, :string
  end
end
