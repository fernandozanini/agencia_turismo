# frozen_string_literal: true

class TiposVendaController < ApplicationController
  before_action :set_tipo_venda, only: %i[show edit update destroy]

  # GET /tipo_vendas
  # GET /tipo_vendas.json
  def index
    @tipos_venda = TipoVenda.order(:nome)
  end

  # GET /tipo_vendas/1
  # GET /tipo_vendas/1.json
  def show; end

  # GET /tipo_vendas/new
  def new
    @tipo_venda = TipoVenda.new
  end

  # GET /tipo_vendas/1/edit
  def edit; end

  # POST /tipo_vendas
  # POST /tipo_vendas.json
  def create
    @tipo_venda = TipoVenda.new(tipo_venda_params)

    respond_to do |format|
      if @tipo_venda.save
        format.html { redirect_to @tipo_venda, notice: 'Tipo de venda criado com sucesso.' }
        format.json { render :show, status: :created, location: @tipo_venda }
      else
        format.html { render :new }
        format.json { render json: @tipo_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_vendas/1
  # PATCH/PUT /tipo_vendas/1.json
  def update
    respond_to do |format|
      if @tipo_venda.update(tipo_venda_params)
        format.html { redirect_to @tipo_venda, notice: 'Tipo de venda atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @tipo_venda }
      else
        format.html { render :edit }
        format.json { render json: @tipo_venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_vendas/1
  # DELETE /tipo_vendas/1.json
  def destroy
    @tipo_venda.destroy
    respond_to do |format|
      format.html { redirect_to tipos_venda_url, notice: 'Tipo de venda excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tipo_venda
    @tipo_venda = TipoVenda.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tipo_venda_params
    params.require(:tipo_venda).permit(:nome, :ativo)
  end
end
