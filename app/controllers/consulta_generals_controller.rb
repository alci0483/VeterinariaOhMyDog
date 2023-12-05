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

  # GET /consulta_generals/1/edit
  def edit
  end

  # POST /consulta_generals or /consulta_generals.json
  def create
    @consulta_general = ConsultaGeneral.new(consulta_general_params)
    if @consulta_general.save
      redirect_to perro_path(@consulta_general.perro_id), notice: "Registro de Consulta General exitoso."
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
