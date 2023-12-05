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

    @usuario = User.find(params[:user_id])
    @perro = @usuario.perros.find_by(nombre: params[:nombre].strip)
    @turno = Turno.find(params[:id])
    @turno.update_column(:estado_turno, 'atendido')
    mensaje = Mensaje.new(contenido: @usuario.name + " te acaban de atender un turno para: " + @turno.tipo_servicio,user_id: @usuario.id)
    mensaje.save
    @servicio=params[:tipo_s]
end

  # GET /vacunacions/1/edit
  def edit

  end

  # POST /vacunacions or /vacunacions.json
  def create
    puts "dentro a accion create del controlador vacunacion"
    @vacunacion = Vacunacion.new(vacunacion_params)

    if @vacunacion.save
      @edad_perro = Perro.find(@vacunacion.perro_id).edad
      if @edad_perro < 4 && @vacunacion.tipo_vacuna == "antirrabica"
        redirect_to new_turno_generado_path(id_perro: @vacunacion.perro_id, dias_refuerzo: 21, tipo_vacuna: @vacunacion.tipo_vacuna)
      else
        if @vacunacion.tipo_vacuna == "antirrabica"
          redirect_to new_turno_generado_path(id_perro: @vacunacion.perro_id, dias_refuerzo: 365, tipo_vacuna: @vacunacion.tipo_vacuna)
        end
      end

      if @vacunacion.tipo_vacuna == "parvovirus"
        redirect_to new_turno_generado_path(id_perro: @vacunacion.perro_id, dias_refuerzo: 365, tipo_vacuna: @vacunacion.tipo_vacuna)
      end

    else
      redirect_to new_turno_generado_path, notice: @vacunacion.errors[:base]
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
