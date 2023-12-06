class PerrosController < ApplicationController
  before_action :set_perro, only: %i[ show edit update destroy ]

  # GET /perros or /perros.json
  def index
    @perros = Perro.all.order(edad: :asc)
  end

  # GET /perros/1 or /perros/1.json
  def show
    @perro = Perro.find(params[:id])
    @castracion = @perro.castracions

    @mostrar_antirrabica = true
    @mostrar_parvovirus = true
    @tiene_turno_antirrabica = Turno.exists?(nombre_perro: @perro.nombre, user_id: @perro.user_id, tipo_servicio: 'antirrabica')

  # Verifica si hay un turno para parvovirus
    @tiene_turno_parvovirus = Turno.exists?(nombre_perro: @perro.nombre, user_id: @perro.user_id, tipo_servicio: 'parvovirus')
    @tiene_turno_castracion = Turno.exists?(nombre_perro: @perro.nombre, user_id: @perro.user_id, tipo_servicio: 'castracion')
    @tiene_turno_desparasitacion = Turno.exists?(nombre_perro: @perro.nombre, user_id: @perro.user_id, tipo_servicio: 'desparasitacion')
    @tiene_turno_consultageneral = Turno.exists?(nombre_perro: @perro.nombre, user_id: @perro.user_id, tipo_servicio: 'consulta general')


    @estado_turno_antirrabica = Turno.find_by(nombre_perro: @perro.nombre, user_id: @perro.user_id, tipo_servicio: 'antirrabica')&.estado_turno
    @estado_turno_parvovirus = Turno.find_by(nombre_perro: @perro.nombre, user_id: @perro.user_id, tipo_servicio: 'parvovirus')&.estado_turno
    @estado_turno_castracion = Turno.find_by(nombre_perro: @perro.nombre, user_id: @perro.user_id, tipo_servicio: 'castracion')&.estado_turno
    @estado_turno_desparasitacion = Turno.find_by(nombre_perro: @perro.nombre, user_id: @perro.user_id, tipo_servicio: 'desparasitacion')&.estado_turno
    @estado_turno_consultageneral = Turno.find_by(nombre_perro: @perro.nombre, user_id: @perro.user_id, tipo_servicio: 'consulta general')&.estado_turno




    if @perro.edad > 1 && @perro.edad <4 && !@perro.vacunacions.where(tipo_vacuna: 'antirrabica').empty?
      if Date.today.to_time.to_i - @perro.vacunacions.where(tipo_vacuna: 'antirrabica').last.created_at.to_time.to_i < 1814400
        @mostrar_antirrabica = false
      end
    elsif @perro.edad > 3 && !@perro.vacunacions.where(tipo_vacuna: 'antirrabica').empty?
      if Date.today.to_time.to_i - @perro.vacunacions.where(tipo_vacuna: 'antirrabica').last.created_at.to_time.to_i < 31536000
        @mostrar_antirrabica = false
      end
    end

    if @perro.edad > 5 && !@perro.vacunacions.where(tipo_vacuna: 'parvovirus').empty?
      if Date.today.to_time.to_i - @perro.vacunacions.where(tipo_vacuna: 'parvovirus').last.created_at.to_time.to_i < 31536000
        @mostrar_parvovirus = false
      end
    end

  end

  # GET /perros/new
  def new
    @perro = Perro.new
    @id_usuario = params[:usuario_id]
  end

  # GET /perros/1/edit
  def edit
  end

  # POST /perros or /perros.json
  def create
    @perro = Perro.new(perro_params)
    if !current_user.admin?
     @perro.user_id = current_user.id
    end
    if @perro.save
      redirect_to usuario_path(@perro.user_id), notice: "Se agrego el perro exitosamente"
    else
      flash[:notice] = "Ya tienes un perro con este nombre"
      render :new, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /perros/1 or /perros/1.json
  def update
    respond_to do |format|
      if @perro.update(perro_params)
        format.html { redirect_to perro_url(@perro), notice: "Perro was successfully updated." }
        format.json { render :show, status: :ok, location: @perro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @perro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perros/1 or /perros/1.json
  def destroy
    @perro.destroy

    respond_to do |format|
      format.html { redirect_to perros_url, notice: "Perro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perro
      @perro = Perro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perro_params
      params.require(:perro).permit(:nombre, :edad, :raza, :sexo, :estado_salud, :user_id, :generar_turno)
    end
end
