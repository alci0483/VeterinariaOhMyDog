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
   def create
      @perdido = Perdido.new(perdido_params)
      if @perdido.save
         redirect_to perdidos_path
       else
         render :new, status: :unprocessable_entity
       end
   end
   def perdido_params
      params.require(:perdido).permit(:nombre, :tamano, :edad, :ubicacion, :raza, :photo, :user_id )

   end
  end
