# frozen_string_literal: true

class Viajante < ApplicationRecord
  validate :valida_cnpj

  private

  def valida_cnpj
    errors.add(:cpf, 'Número inválido!') unless CPF.valid?(cpf)
  end
end
