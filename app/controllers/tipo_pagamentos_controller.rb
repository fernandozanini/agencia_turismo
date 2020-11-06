# frozen_string_literal: true

class TipoPagamentosController < ApplicationController
  before_action :set_tipo_pagamento, only: %i[show edit update destroy]

  # GET /tipo_pagamentos
  # GET /tipo_pagamentos.json
  def index
    @tipo_pagamentos = TipoPagamento.order(:nome)
  end

  # GET /tipo_pagamentos/1
  # GET /tipo_pagamentos/1.json
  def show; end

  # GET /tipo_pagamentos/new
  def new
    @tipo_pagamento = TipoPagamento.new
  end

  # GET /tipo_pagamentos/1/edit
  def edit; end

  # POST /tipo_pagamentos
  # POST /tipo_pagamentos.json
  def create
    @tipo_pagamento = TipoPagamento.new(tipo_pagamento_params)

    respond_to do |format|
      if @tipo_pagamento.save
        format.html { redirect_to @tipo_pagamento, notice: 'Tipo de pagamento criado com sucesso.' }
        format.json { render :show, status: :created, location: @tipo_pagamento }
      else
        format.html { render :new }
        format.json { render json: @tipo_pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_pagamentos/1
  # PATCH/PUT /tipo_pagamentos/1.json
  def update
    respond_to do |format|
      if @tipo_pagamento.update(tipo_pagamento_params)
        format.html { redirect_to @tipo_pagamento, notice: 'Tipo pagamento atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @tipo_pagamento }
      else
        format.html { render :edit }
        format.json { render json: @tipo_pagamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_pagamentos/1
  # DELETE /tipo_pagamentos/1.json
  def destroy
    @tipo_pagamento.destroy
    respond_to do |format|
      format.html { redirect_to tipo_pagamentos_url, notice: 'Tipo pagamento excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_tipo_pagamento
    @tipo_pagamento = TipoPagamento.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def tipo_pagamento_params
    params.require(:tipo_pagamento).permit(:nome, :ativo, :observacao)
  end
end
