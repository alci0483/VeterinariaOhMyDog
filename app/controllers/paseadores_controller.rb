class PaseadoresController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def show
    @paseador = Paseador.find(params[:id])
  end
  def index
   # Aquí recuperas la lista de cuidadores de perros desde la base de datos.
   @paseadores = Paseador.all.order(created_at: :desc)
  end
  def new
    @paseador = Paseador.new
  end

  def create
    @paseador = Paseador.new(paseador_params)
    if @paseador.save
      redirect_to paseadores_path, notice: "Paseador publicado con éxito."
    else
      
      render :new, status: :unprocessable_entity
    end
  end

  def contactar
    @paseador = Paseador.find(params[:id])
    # Muestra el formulario de solicitud de contacto
  end

  def enviar_contacto
    @paseador = Paseador.find(params[:id])
    @solicitud = SolicitudContacto.new(params[:solicitud_contacto])
    if @solicitud.save
      ContactoMailer.enviar_solicitud_contacto(@solicitud, @paseador).deliver
      redirect_to paseadores_path, notice: 'Tu solicitud de contacto ha sido enviada.'
    else
      render :contactar
    end
  end

  private

  def paseador_params
    params.require(:paseador).permit(:nombre, :apellido, :horarios, :ubicacion, :contacto)
  end
end
