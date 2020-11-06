# frozen_string_literal: true

require 'nokogiri'
require 'httparty'

class BuscarPromocoesMilhas
  include Interactor
  include Interactor::Contracts

  expects do
    required(:site_id).filled
  end

  # retorna o conteudo com titulo correto
  def call
    site_id = context.site_id
    site = Site.find(site_id)
    context.nome_site = site.nome
    context.pontuacao_teto = site.teto_pontuacao

    # site livelo
    buscar_dados_livelo(site) if site_id == 1
    # site smiles xr
    buscar_dados_smiles_xr(site) if site_id == 2
    # site smiles iphone11
    buscar_dados_smiles_iphone11(site) if site_id == 3
  end

  private

  def buscar_dados_livelo(site)
    context.dados = []
    if site.codigo.present?
      site.codigo.split(',').each do |codigo|
        resultado_pagina = HTTParty.get("#{site.url}#{codigo}")&.first
        if resultado_pagina['parity'].to_i >= site.teto_pontuacao
          context.dados << { codigo: resultado_pagina['partnerCode'], pontuacao: resultado_pagina['parity'], data_inicial: resultado_pagina['startDate'], data_final: resultado_pagina['endDate'], termos: resultado_pagina['legalTerms'], url: resultado_pagina['url'] }
        end
      end
      context.dados = context.dados.sort_by! { |dado| -dado[:pontuacao] }
    end
  end

  def buscar_dados_smiles_xr(site)
    context.dados = []
    if site.codigo.present?
      site.codigo.split(',').each do |codigo|
        unparsed_page = HTTParty.get("#{site.url}#{codigo}")
        parsed_page = Nokogiri::HTML(unparsed_page)
        parsed_page.css('.box-produto .ui-outputpanel').each do |item|
          dados = item.search('a')[0].attributes['onclick'].value
          dados = dados[dados.index('[')..dados.index(']}')]
          dados = JSON.parse(dados)
          if !dados[0]['name'].downcase.start_with?('shop-capa', 'shop-pel') && item.search('.preco-por')[1].text.delete('.').to_i <= site.teto_pontuacao
            context.dados << { codigo: dados[0]['name'], pontuacao: item.search('.preco-por')[1].text, preco: dados[0]['price'], data_inicial: '', data_final: '', termos: dados[0]['category'], url: '' }
          end
        end
      end
      context.dados = context.dados.sort_by! { |dado| dado[:pontuacao].to_i }
    end
  end

  def buscar_dados_smiles_iphone11(site)
    context.dados = []
    if site.codigo.present?
      site.codigo.split(',').each do |codigo|
        unparsed_page = HTTParty.get("#{site.url}#{codigo}")
        parsed_page = Nokogiri::HTML(unparsed_page)
        parsed_page.css('.box-produto .ui-outputpanel').each do |item|
          dados = item.search('a')[0].attributes['onclick'].value
          dados = dados[dados.index('[')..dados.index(']}')]
          dados = JSON.parse(dados)
          if !dados[0]['name'].downcase.start_with?('shop-capa', 'shop-pel') && item.search('.preco-por')[1].text.delete('.').to_i <= site.teto_pontuacao
            context.dados << { codigo: dados[0]['name'], pontuacao: item.search('.preco-por')[1].text, preco: dados[0]['price'], data_inicial: '', data_final: '', termos: dados[0]['category'], url: '' }
          end
        end
      end
      context.dados = context.dados.sort_by! { |dado| dado[:pontuacao].to_i }
    end
  end
end
