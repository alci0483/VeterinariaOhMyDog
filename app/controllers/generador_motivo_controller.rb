class GeneradorMotivoController < ApplicationController
  def edit
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts "+++++++++++++++++++++++++++++++++entro a accion agregar_descripcion del controlador turno generado"
    @turno = Turno.find(params[:id_turno])
  end

  def update
    @turno = Turno.find(params[:id])

    begin
      if @turno.update!(estado_turno: "rechazado", motivo_rechazo: params[:turno][:motivo_rechazo])
        mensaje = Mensaje.new(contenido: "hola " + User.find(@turno.user_id).name + "! Se te rechazo un turno para tu perro: " + @turno.nombre_perro + "para : " + @turno.tipo_servicio + ", porque " + @turno.motivo_rechazo, user_id: @turno.user_id)
        mensaje.save

        redirect_to turnos_path, notice: 'Turno creado exitosamente.'
      else
        redirect_to edit_generador_motivo_path, notice: 'No se puede sacar turno para esa Banda Horaria'
      end
    rescue StandardError => e
      puts "Error durante la actualización: #{e.message}"
      redirect_to edit_generador_motivo_path, notice: 'Error durante la actualización.'
    end
  end

end
