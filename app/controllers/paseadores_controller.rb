class PaseadoresController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def show
    @paseador = Paseador.find(params[:id])
  end
  def index
   # Aquí recuperas la lista de cuidadores de perros desde la base de datos.
   @paseadores = Paseador.all
  end
  def new
    @paseador = Paseador.new
  end

  def create
    @paseador = Paseador.new(paseador_params)
    if @paseador.save
      redirect_to paseadores_path, notice: "Paseador publicado con éxito."
    else
      @error_message = "Ya existe un paseador con el mismo nombre y ubicación."
      render :new, status: :unprocessable_entity
    end
  end

  private

  def paseador_params
    params.require(:paseador).permit(:nombre, :apellido, :horarios, :ubicacion, :contacto)
  end
end
