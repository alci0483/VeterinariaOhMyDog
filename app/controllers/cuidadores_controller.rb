class CuidadoresController < ApplicationController
   before_action :authenticate_user!, only: [:new]
  def show
    @cuidador = Cuidador.find(params[:id])
  end
  def index
   # Aquí recuperas la lista de cuidadores de perros desde la base de datos.
   @cuidadores = Cuidador.all.order(created_at: :desc)
  end
  def new
    @cuidador = Cuidador.new
  end
  def create
    @cuidador = Cuidador.new(cuidador_params)

  if @cuidador.save
     redirect_to cuidadores_path, notice: "Cuidador publicado con éxito."
  else
    @error_message = "Ya existe un cuidador con este email"
    render :new, status: :unprocessable_entity
  end
end
def contactar
 @cuidador = Cuidador.find(params[:id])
  @solicitud = Solicitud.new
 render 'cuidadores/contactar'

end

def enviar_contacto
  @cuidador = Cuidador.find(params[:id])

  if user_signed_in?
    @solicitud = Solicitud.new(solicitud_params)
    @solicitud.user = current_user
  else
    @solicitud = Solicitud.new(solicitud_params)
  end

  if @solicitud.save
    ContactoMailer.enviar_solicitud_contacto_cuidador(@solicitud, @cuidador, current_user).deliver
    redirect_to cuidadores_path, notice: 'Tu solicitud de contacto ha sido enviada.'
  else
    # Maneja el caso en que la solicitud no se pueda guardar
    # Puedes mostrar un mensaje de error o redirigir a una página de error
  end
end


private

def solicitud_params

  params.require(:solicitud).permit(:nombre, :email, :mensaje)
end




  private

  def cuidador_params

    params.require(:cuidador).permit(:nombre, :apellido, :horarios, :ubicacion, :contacto, :email)
  end
end
