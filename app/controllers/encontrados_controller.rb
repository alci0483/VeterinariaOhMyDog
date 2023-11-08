class EncontradosController < ApplicationController
    def index
     @encontrados=Encontrado.all
    end
    def show
    @encontrado= Encontrado.find(params[:id])
     
    end
    def new
     @encontrado= Encontrado.new
    end
    def create
      @encontrado = Encontrado.new(encontrado_params)
      if @encontrado.save
         redirect_to encontrados_path
       else
          render :new, status: :unprocessable_entity
       end
    end
    def encontrado_params
      params.require(:encontrado).permit(:nombre, :tamano, :edad, :ubicacion, :raza, :photo )
      
    end
   end
 