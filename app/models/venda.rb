# frozen_string_literal: true

class Venda < ApplicationRecord
  belongs_to :cliente
  belongs_to :tipo_venda
  belongs_to :empresa
  belongs_to :tipo_pagamento
  belongs_to :viajante
  belongs_to :forma_pagamento

  enum status: %i[aguardando_pagamento concluído cancelado]

  validates :data_venda, :data_utilizacao, presence: true
end
