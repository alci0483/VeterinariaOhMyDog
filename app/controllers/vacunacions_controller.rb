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
      redirect_to perro_path(@vacunacion.perro_id), notice: "Registro de Vacunacion Exitoso."

      @perro = Perro.find(@vacunacion.perro_id)
      @edad_perro = @perro.edad
      @usuario = User.find(@perro.user_id)

      if @edad_perro < 4 && @vacunacion.tipo_vacuna == "antirrabica"
        flash[:notice] = "Ya se aplico la vacuna antirrabica, se le genero al usuario de este perro un turno a los 21 dias"

        turno_nuevo = Turno.new(nombre_perro: @perro.nombre, tipo_servicio: "Vacunación",banda_horaria: "Turno 1 - 8 a 13 hs",fecha: Date.today + 21, descripcion: "Vacuna de refuerzo", user_id: @usuario.id, estado_turno: "pendiente")
        turno_nuevo.save

        mensaje = Mensaje.new(contenido: "Se te genero un turno de refuerzo para tu perro, ve a tus turno para mas informacion", user_id: @usuario.id)
        mensaje.save
      else
        if @vacunacion.tipo_vacuna == "antirrabica"
          flash[:notice] = "Ya se aplico la vacuna antirrabica, se le genero al usuario de este perro un turno dentro de un año"
          turno_nuevo = Turno.new(nombre_perro: @perro.nombre, tipo_servicio: "Vacunación",banda_horaria: "Turno 1 - 8 a 13 hs",fecha: Date.today + 365, descripcion: "Vacuna de refuerzo", user_id: @usuario.id, estado_turno: "pendiente")
          turno_nuevo.save

          mensaje = Mensaje.new(contenido: "Se te genero un turno de refuerzo para tu perro, ve a tus turno para mas informacion", user_id: @usuario.id)
          mensaje.save
        end
      end

      if @vacunacion.tipo_vacuna == "parvovirus"
        flash[:notice] = "Ya se aplico la vacuna parvovirus, se le genero al usuario de este perro un turno dentro de un año"
        turno_nuevo = Turno.new(nombre_perro: @perro.nombre, tipo_servicio: "Vacunación",banda_horaria: "Turno 1 - 8 a 13 hs",fecha: Date.today + 365, descripcion: "Vacuna de refuerzo", user_id: @usuario.id, estado_turno: "pendiente")
        turno_nuevo.save

        mensaje = Mensaje.new(contenido: "Se te genero un turno de refuerzo para tu perro, ve a tus turno para mas informacion", user_id: @usuario.id)
        mensaje.save
      end

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
