class VacunacionsController < ApplicationController
  before_action :set_vacunacion, only: %i[ show edit update destroy ]

  # GET /vacunacions or /vacunacions.json
  def index
    @vacunacions = Vacunacion.all
  end

  # GET /vacunacions/1 or /vacunacions/1.json
  def show
  end

  # GET /vacunacions/new
  def new
    @vacunacion = Vacunacion.new
    @perro_id = params[:perro_id]
  end

  # GET /vacunacions/1/edit
  def edit
  end

  # POST /vacunacions or /vacunacions.json
  def create
    @vacunacion = Vacunacion.new(vacunacion_params)


    if @vacunacion.save
      redirect_to perro_path(@vacunacion.perro_id), notice: "Cuidador publicado con éxito."
    else
      @error_message = "Ya existe este Registro"
      render :new, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /vacunacions/1 or /vacunacions/1.json
  def update
    respond_to do |format|
      if @vacunacion.update(vacunacion_params)
        format.html { redirect_to vacunacion_url(@vacunacion), notice: "Vacunacion was successfully updated." }
        format.json { render :show, status: :ok, location: @vacunacion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vacunacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacunacions/1 or /vacunacions/1.json
  def destroy
    @vacunacion.destroy

    respond_to do |format|
      format.html { redirect_to vacunacions_url, notice: "Vacunacion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacunacion
      @vacunacion = Vacunacion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vacunacion_params
      params.require(:vacunacion).permit(:tipo_vacuna, :marca_vacuna, :dosis, :numero_lote, :perro_id)
    end
end
