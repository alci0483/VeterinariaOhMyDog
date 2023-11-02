class CuidadoresController < ApplicationController
   before_action :authenticate_user!, only: [:new]
  def show
    @cuidador = Cuidador.find(params[:id])
  end
  def index
   # Aquí recuperas la lista de cuidadores de perros desde la base de datos.
   @cuidadores = Cuidador.all
  end
  def new
    @cuidador = Cuidador.new
  end
  def create
    @cuidador = Cuidador.new(cuidador_params)

  if @cuidador.save
     redirect_to cuidadores_path, notice: "Cuidador publicado con éxito."
  else
    @error_message = "Ya existe un cuidador con el mismo nombre y ubicación."
    render :new, status: :unprocessable_entity
  end
end



  private

  def cuidador_params
    params.require(:cuidador).permit(:nombre, :apellido, :horarios, :ubicacion, :contacto)
  end
end
