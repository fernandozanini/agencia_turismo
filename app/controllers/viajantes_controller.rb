# frozen_string_literal: true

class ViajantesController < ApplicationController
  before_action :set_viajante, only: %i[show edit update destroy]

  # GET /viajantes
  # GET /viajantes.json
  def index
    @viajantes = Viajante.order(:nome)
  end

  # GET /viajantes/1
  # GET /viajantes/1.json
  def show; end

  # GET /viajantes/new
  def new
    @viajante = Viajante.new
  end

  # GET /viajantes/1/edit
  def edit; end

  # POST /viajantes
  # POST /viajantes.json
  def create
    @viajante = Viajante.new(viajante_params)

    respond_to do |format|
      if @viajante.save
        format.html { redirect_to @viajante, notice: 'Viajante cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @viajante }
      else
        format.html { render :new }
        format.json { render json: @viajante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /viajantes/1
  # PATCH/PUT /viajantes/1.json
  def update
    respond_to do |format|
      if @viajante.update(viajante_params)
        format.html { redirect_to @viajante, notice: 'Viajante atualizado com sucesso.' }
        format.json { render :show, status: :ok, location: @viajante }
      else
        format.html { render :edit }
        format.json { render json: @viajante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viajantes/1
  # DELETE /viajantes/1.json
  def destroy
    @viajante.destroy
    respond_to do |format|
      format.html { redirect_to viajantes_url, notice: 'Viajante excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_viajante
    @viajante = Viajante.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def viajante_params
    params.require(:viajante).permit(:nome, :rg, :cpf, :data_nascimento, :passaporte)
  end
end
