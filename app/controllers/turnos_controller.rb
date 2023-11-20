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
    @turno = Turno.new(turno_params.merge(estado_turno: "pendiente"))
    if hora_en_banda_horaria(@turno) && @turno.save
      redirect_to turnos_path, notice: 'Turno creado exitosamente.'
    else
      redirect_to new_turno_path, notice: 'No se puede sacar turno para esa Banda Horaria'
    end
  end

    private
  def turno_params
    params.require(:turno).permit(:nombre_perro, :primera_visita, :tipo_servicio, :banda_horaria, :fecha, :descripcion, :user_id, :estado_turno)
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
