# frozen_string_literal: true

class VendasController < ApplicationController
  before_action :set_venda, only: %i[show edit update destroy]
  before_action :carregar_listas

  # GET /vendas
  # GET /vendas.json
  def index
    @vendas = Venda.all
  end

  # GET /vendas/1
  # GET /vendas/1.json
  def show; end

  # GET /vendas/new
  def new
    @venda = Venda.new
  end

  # GET /vendas/1/edit
  def edit
    @venda.custo = ActionController::Base.helpers.number_to_currency(@venda.custo, unit: '').to_s.strip
    @venda.venda = ActionController::Base.helpers.number_to_currency(@venda.venda, unit: '').to_s.strip
    @venda.lucro = ActionController::Base.helpers.number_to_currency(@venda.lucro, unit: '').to_s.strip
  end

  # POST /vendas
  # POST /vendas.json
  def create
    @venda = Venda.new(venda_params)

    respond_to do |format|
      if @venda.save
        format.html { redirect_to @venda, notice: 'Venda was successfully created.' }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendas/1
  # PATCH/PUT /vendas/1.json
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to @venda, notice: 'Venda was successfully updated.' }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1
  # DELETE /vendas/1.json
  def destroy
    @venda.destroy
    respond_to do |format|
      format.html { redirect_to vendas_url, notice: 'Venda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_venda
    @venda = Venda.find(params[:id])
  end

  def carregar_listas
    @clientes = Cliente.select(:id, :nome).order(:nome)
    @tipos_venda = TipoVenda.select(:id, :nome).order(:nome)
    @tipos_pagamento = TipoPagamento.select(:id, :nome).order(:nome)
    @formas_pagamento = FormaPagamento.select(:id, :nome).order(:nome)
    @empresas = Empresa.select(:id, :nome).order(:nome)
    @viajantes = Viajante.select(:id, :nome).order(:nome)
  end

  # Only allow a list of trusted parameters through.
  def venda_params
    if params[:venda][:custo].present?
      params[:venda][:custo] = params[:venda][:custo].delete('.').gsub(',', '.')
    end
    if params[:venda][:venda].present?
      params[:venda][:venda] = params[:venda][:venda].delete('.').gsub(',', '.')
    end
    if params[:venda][:lucro].present?
      params[:venda][:lucro] = params[:venda][:lucro].delete('.').gsub(',', '.')
    end
    params.require(:venda).permit(:data_venda, :cliente_id, :tipo_venda_id, :data_utilizacao, :empresa_id, :tipo_pagamento_id, :localizador, :viajante_id, :forma_pagamento_id, :qtd_parcelas, :custo, :venda, :lucro, :lucro_porcentagem, :data_recebimento, :status)
  end
end
