class PerdidosController < ApplicationController
   def index
    @perdidos=Perdido.all.order(created_at: :desc)
   end
   def show
    @perdido= Perdido.find(params[:id])

   end
   def new
    @perdido= Perdido.new
   end
   def encontrar
      @perdido = Perdido.find(params[:id])
     @perdido.update_column(:estado, 'Encontrado')  
     redirect_to perdidos_path, notice: 'Se actualizó como perro Encontrado exitosamente.'
     end
     
   def create
      @perdido = Perdido.new(perdido_params.merge(estado: "perdido"))
      if @perdido.save
         redirect_to perdidos_path
       else
         render :new, status: :unprocessable_entity
       end
   end
   def perdido_params
      params.require(:perdido).permit(:nombre, :tamano, :edad, :ubicacion, :raza, :photo, :user_id, :observacion, :estado )

   end
  end
