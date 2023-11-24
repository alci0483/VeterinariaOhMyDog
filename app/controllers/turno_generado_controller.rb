class TurnoGeneradoController < ApplicationController
  def new
    puts "entro a accion new del controlador turno generado"
    @turno = Turno.new
    @perro = Perro.find(params[:id_perro])
    @dias_refuerzo = params[:dias_refuerzo]
    @tipo_vacuna = params[:tipo_vacuna]
  end

  def create
    puts "entro a accion create del controlador turno generado"
    @turno = Turno.new(turno_params.merge(estado_turno: "confirmado"))

    if @turno.save
      mensaje = Mensaje.new(contenido:"hola "+User.find(@turno.user_id).name+"! Se te genero un turno de refuerzo para tu perro: "+@turno.nombre_perro+", ve a tus turno para mas informacion", user_id: @turno.user_id)
      mensaje.save

      @usuario = User.find(@turno.user_id)
      redirect_to perro_path(@usuario.perros.find_by(nombre: @turno.nombre_perro).id), notice: 'Turno creado exitosamente.'
    else
      redirect_to new_turno_path, notice: 'No se puede sacar turno para esa Banda Horaria'
    end
  end


  private

  def turno_params
    params.require(:turno).permit(:nombre_perro, :primera_visita, :tipo_servicio, :banda_horaria, :fecha, :descripcion, :user_id, :estado_turno, :perro_no_registrado)
  end

end
