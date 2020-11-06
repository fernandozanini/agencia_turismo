# frozen_string_literal: true

Rails.application.routes.draw do
  resources :vendas
  resources :tipos_venda
  resources :formas_pagamento
  resources :empresas
  resources :tipo_pagamentos
  resources :viajantes
  resources :clientes
  resources :sites
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :promocoes, only: %i[index]

  root 'promocoes#index'
end
