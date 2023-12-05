class CastracionsController < ApplicationController
  before_action :set_castracion, only: %i[ show edit update destroy ]

  # GET /castracions or /castracions.json
  def index
    @castracions = Castracion.all
  end

  # GET /castracions/1 or /castracions/1.json
  def show
  end

  # GET /castracions/new
  def new
    @castracion = Castracion.new
    if params.key?(:nombre) && params.key?(:user_id)
      # Si tienes tanto el nombre como el user_id, busca el perro por nombre dentro de los perros del usuario.
      usuario = User.find(params[:user_id])
      perro = usuario.perros.find_by(nombre: params[:nombre].strip)
      @turno = Turno.find(params[:id])
      @turno.update_column(:estado_turno, 'atendido')
      @usuario = User.find(@turno.user_id)
      mensaje = Mensaje.new(
        contenido: @usuario.name + " te acaban de atender un turno para: " + @turno.tipo_servicio,
        user_id: @usuario.id
      )
      mensaje.save
    else
      # Si no tienes el nombre, busca el perro por su ID.
      perro = Perro.find(params[:perro_id])
    end

    @perro_id = perro.id
    @edad_perro = perro.edad
  end

  # GET /castracions/1/edit
  def edit
  end

  # POST /castracions or /castracions.json
  def create
    @castracion = Castracion.new(castracion_params)

    if @castracion.save
      redirect_to perro_path(@castracion.perro_id), notice: "Castración publicado con éxito."
    else
      @error_message = "Ya existe este Registro"
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /castracions/1 or /castracions/1.json
  def update
    respond_to do |format|
      if @castracion.update(castracion_params)
        format.html { redirect_to castracion_url(@castracion), notice: "Castracion was successfully updated." }
        format.json { render :show, status: :ok, location: @castracion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @castracion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /castracions/1 or /castracions/1.json
  def destroy
    @castracion.destroy

    respond_to do |format|
      format.html { redirect_to castracions_url, notice: "Castracion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_castracion
      @castracion = Castracion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def castracion_params
      params.require(:castracion).permit(:descripcion, :medicamentos, :fecha, :perro_id)
    end
end
