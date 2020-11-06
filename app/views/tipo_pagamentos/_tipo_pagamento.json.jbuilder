json.extract! tipo_pagamento, :id, :nome, :ativo, :observacao, :created_at, :updated_at
json.url tipo_pagamento_url(tipo_pagamento, format: :json)
