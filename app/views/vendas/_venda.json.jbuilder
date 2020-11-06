json.extract! venda, :id, :data_venda, :cliente_id, :tipo_venda_id, :data_utilizacao, :empresa_id, :tipo_pagamento_id, :localizador, :viajante_id, :forma_pagamento_id, :qtd_parcelas, :custo, :venda, :lucro, :lucro_porcentagem, :data_recebimento, :status, :created_at, :updated_at
json.url venda_url(venda, format: :json)
