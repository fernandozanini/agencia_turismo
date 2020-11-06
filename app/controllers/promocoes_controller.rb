# frozen_string_literal: true

class PromocoesController < ApplicationController
  def index
    @sites = Site.order(:nome).map { |objeto| [objeto.nome, objeto.id] }
    params[:sites] = @sites[0][1] unless params[:sites].present?
    @resultados = BuscarPromocoesMilhas.call(site_id: params[:sites].to_i)
    # byebug
  end
end
