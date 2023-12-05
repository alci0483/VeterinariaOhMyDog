class EncontradosController < ApplicationController
    def index
     @encontrados=Encontrado.all.order(created_at: :desc)
    end
    def show
    @encontrado= Encontrado.find(params[:id])

    end
    def new
     @encontrado= Encontrado.new
    end


    # Este codigo es nuevo
    def create
      @encontrado = Encontrado.new(encontrado_params)
      @encontrado.codigo = "1"
     if !user_signed_in?
      @encontrado.codigo = SecureRandom.hex(6)
     end
      if @encontrado.save
        
        if !user_signed_in?
          UserMailer.with(email: @encontrado.email, codigo: @encontrado.codigo).welcome.deliver_later
        flash[:notice] = "Perro encontrado publicado exitosamente.  Tu Código de publicacion es: #{@encontrado.codigo}"
        else
          
          flash[:notice] = "Perro encontrado publicado exitosamente."
        end
        redirect_to encontrados_path
      else
          render :new, status: :unprocessable_entity
          flash[:notice] = "Perro encontrado no se puedo publicar"
       end
    end
    def edit
      @encontrado = Encontrado.find(params[:id])
      
    end
    
    def update
      @encontrado = Encontrado.find(params[:id])
      if @encontrado.codigo == "1"
       @encontrado.update_column(:ubicacion, params[:encontrado][:ubicacion])
        redirect_to encontrados_path, notice: "Descripcion y Ubicación modificada exitosamente."
      else
        codigo = params[:codigo_ingresado]
        if codigo == @encontrado.codigo
          @encontrado.update_column(:ubicacion, params[:encontrado][:ubicacion])
        redirect_to encontrados_path, notice: "Descripcion y Ubicación  modificada exitosamente."
        else
          redirect_to edit_encontrado_path, notice: "Contraseña equivocada, coloca la contraseña correcta para poder modificar la Publicacion"
     
      end

      end
       # render :edit, status: :unprocessable_entity
      #end
    end
    def encontrado_params
      params.require(:encontrado).permit(:nombre, :tamano, :ubicacion, :raza, :photo, :user_id, :email, :codigo)

    end

   


    #  Este codigo es nuevo 
   end
