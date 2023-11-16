class ConsultaGeneralsController < ApplicationController
  before_action :set_consulta_general, only: %i[ show edit update destroy ]

  # GET /consulta_generals or /consulta_generals.json
  def index
    @consulta_generals = ConsultaGeneral.all
  end

  # GET /consulta_generals/1 or /consulta_generals/1.json
  def show
  end

  # GET /consulta_generals/new
  def new
    @consulta_general = ConsultaGeneral.new
    @perro_id = params[:perro_id]
  end

  # GET /consulta_generals/1/edit
  def edit
  end

  # POST /consulta_generals or /consulta_generals.json
  def create
    @consulta_general = ConsultaGeneral.new(consulta_general_params)
    if @consulta_general.save
      redirect_to perro_path(@consulta_general.perro_id), notice: "Desparasitacion publicado con éxito."
    else
      @error_message = "Ya existe este Registro"
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /consulta_generals/1 or /consulta_generals/1.json
  def update
    respond_to do |format|
      if @consulta_general.update(consulta_general_params)
        format.html { redirect_to consulta_general_url(@consulta_general), notice: "Consulta general was successfully updated." }
        format.json { render :show, status: :ok, location: @consulta_general }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consulta_general.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consulta_generals/1 or /consulta_generals/1.json
  def destroy
    @consulta_general.destroy

    respond_to do |format|
      format.html { redirect_to consulta_generals_url, notice: "Consulta general was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consulta_general
      @consulta_general = ConsultaGeneral.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consulta_general_params
      params.require(:consulta_general).permit(:descripcion, :fecha, :perro_id)
    end
end
