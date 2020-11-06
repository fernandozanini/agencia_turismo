# frozen_string_literal: true

class FormasPagamentoController < ApplicationController
  before_action :set_forma_pagamento, only: %i[show edit update destroy]

  # GET /formas_pagamento
  # GET /formas_pagamento.json
  def index
    @formas_pagamento = FormaPagamento.order(:nome)
  end

  # GET /formas_pagamento/1
  # GET /formas_pagamento/1.json
  def show; end

  # GET /formas_pagamento/new
  def new
    @forma_pagamento = FormaPagamento.new
  end

  # GET /formas_pagamento/1/edit
  def edit; end

  # POST /formas_pagamento
  # POST /formas_pagamento.json
  def create
    @forma_pagamento = FormaPagamento.new(forma_pagamento_params)

    respond_to do |format|
      if @forma_pagamento.save
        format.html { redirect_to @forma_pagamento, notice: 'Forma de pagamento criado com sucesso.' }
        format.json { render :show, status: :created, location: @forma_pagamento }
      else
        format.html { render :new }
        format.json { render json: @forma_pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /formas_pagamento/1
  # PATCH/PUT /formas_pagamento/1.json
  def update
    respond_to do |format|
      if @forma_pagamento.update(forma_pagamento_params)
        format.html { redirect_to @forma_pagamento, notice: 'Forma de pagamento atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @forma_pagamento }
      else
        format.html { render :edit }
        format.json { render json: @forma_pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formas_pagamento/1
  # DELETE /formas_pagamento/1.json
  def destroy
    @forma_pagamento.destroy
    respond_to do |format|
      format.html { redirect_to formas_pagamento_url, notice: 'Forma de pagamento excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_forma_pagamento
    @forma_pagamento = FormaPagamento.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def forma_pagamento_params
    params.require(:forma_pagamento).permit(:nome, :ativo, :observacao)
  end
end
