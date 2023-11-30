class TurnosController < ApplicationController

  def index
    if user_signed_in? && !current_user.admin?
      @turnos = User.find(current_user.id).turnos.order(fecha: :asc, banda_horaria: :asc)
    else
      if user_signed_in?
        @turnos = Turno.all.order(fecha: :asc, banda_horaria: :asc)
      end
    end
end
  def new
    @turno = Turno.new
  end

  def create
  # Verifica la presencia de los parámetros antes de llamar a join
  nombre_perro = params.dig(:turno, :nombre_perro)&.join("  ")
  tipo_servicio = params.dig(:turno, :tipo_servicio)&.join("  ")
  nuevo_perro = params.dig(:turno, :primera_visita)

  if nombre_perro.blank? &&  nuevo_perro == '0'
    redirect_to new_turno_path, notice: 'Por favor escoge los  perros que llevaras o si tienes un perro nuevo '
  return
  end
  if tipo_servicio.blank?
    redirect_to new_turno_path, notice: 'Por favor selecciona los servicios que planeas utilizar. '
  return
  end

  @turno = Turno.new(turno_params.merge(estado_turno: "pendiente", nombre_perro: nombre_perro, tipo_servicio: tipo_servicio))
    @user=User.find(@turno.user_id)
    if  @turno.save
      puts "se  pudo crear turno"
    redirect_to turnos_path, notice: 'Turno creado exitosamente.'
  else
    puts "entro acaaaaaa"
    redirect_to new_turno_path, notice: 'No se puede sacar turno para esa Banda Horaria'
  end

end

  def destroy
    @turno = Turno.find(params[:id])
    @turno.destroy
    redirect_to turnos_path, notice: 'Turno eliminado exitosamente.'
  end
  def cancelar
    @turno = Turno.find(params[:id])
    @turno.update_column(:estado_turno, 'cancelado')
    @usuario = User.find(@turno.user_id)
    redirect_to turnos_path, notice: 'Turno cancelado exitosamente.'

    User.all.each do |u|
      if u.role == "admin"
        mensaje = Mensaje.new(
         contenido: @usuario.name + " acaba de cancelar un turno para: " + @turno.tipo_servicio,
         user_id: u.id
        )
        mensaje.save
      end
     end
   end
  def confirmar
  @turno = Turno.find(params[:id])
  @turno.update_column(:estado_turno, 'confirmado')
  @usuario = User.find(@turno.user_id)

  redirect_to turnos_path, notice: 'Turno confirmado exitosamente.'

  mensaje = Mensaje.new(
    contenido: @usuario.name + " te acaban de confirmar un turno para: " + @turno.tipo_servicio,
    user_id: @usuario.id
  )
  mensaje.save
end

  def rechazar
    @turno = Turno.find(params[:id])
    redirect_to edit_generador_motivo_path(id_turno: @turno)
  end


    private
    def turno_params
    params.require(:turno).permit(:nombre_perro, :primera_visita, :tipo_servicio, :banda_horaria, :fecha, :descripcion, :user_id, :estado_turno, :perro_no_registrado)
    end
  def hora_en_banda_horaria(turno)
    #si es cualquier otro dia, puede agregar libremente el el turno.
    if !turno.fecha.today?
    return true
    end
    # Obtener la hora actual
    current_time = Time.now
    # Obtener los segundos desde la medianoche
    segundos = current_time.hour * 3600 + current_time.min * 60
    #si estoy dentro de estas condiciones no puedo  no puedo crear turno(sacar turno 1 entre 8 24 hsy sacar turno entre  16 y 24hs)
    if ((segundos >= 28800) && (segundos <= 57600) && turno.banda_horaria == "Turno 1 - 8 a 13 hs") || (segundos > 57600)
      return false
    end
    # los otros casos si se pueden agregar
    return true

   end

end
