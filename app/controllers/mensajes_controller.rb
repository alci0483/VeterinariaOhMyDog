# app/controllers/mensajes_controller.rb
class MensajesController < ApplicationController
  def index
    @usuario = User.find(current_user.id)
    @mensajes = @usuario.mensajes
  end

  def create
    @mensaje = Mensaje.new(mensaje_params)

    if @mensaje.save
      # Aquí puedes redirigir o hacer otras acciones si el mensaje se guarda correctamente.
      redirect_to some_path, notice: 'Mensaje guardado exitosamente.'
    else
      # Aquí puedes manejar el caso en el que el mensaje no se guarda correctamente.
      render :new
    end
  end

  private

  def mensaje_params
    params.require(:mensaje).permit(:contenido, :user_id)
  end
end
