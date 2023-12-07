class AdopcionsController < ApplicationController
  before_action :set_adopcion, only: %i[ show edit update destroy ]

  # GET /adopcions or /adopcions.json
  def index
    @adopcions = Adopcion.all.order(created_at: :desc)
  end

  # GET /adopcions/1 or /adopcions/1.json
  def show
  end

  # GET /adopcions/new
  def new
    @adopcion = Adopcion.new
  end

  # GET /adopcions/1/edit
  def edit
    @adopcion = Adopcion.find(params[:id])
  end

  # POST /adopcions or /adopcions.json
  def create
    @adopcion = Adopcion.new(adopcion_params.merge(estado: "en adopcion"))



    if @adopcion.save
      redirect_to adopcions_path, notice: "La Nueva publicacion de Adopcion fue Exitosa"
    else
      @error_message = "Ya Existe esta Publicacion de Adopcion"
      render :new, status: :unprocessable_entity
    end

  end

  def adoptar
   @adopcion = Adopcion.find(params[:id])
  @adopcion.update_column(:estado, 'Adoptado')
  redirect_to adopcions_path, notice: 'Se actualizó como perro adoptado exitosamente.'
  end

  # PATCH/PUT /adopcions/1 or /adopcions/1.json
  def update

    if @adopcion.update_column(:nombre, params[:adopcion][:nombre]) && @adopcion.update_column(:tamanio, params[:adopcion][:tamanio]) && @adopcion.update_column(:edad, params[:adopcion][:edad]) && @adopcion.update_column(:ubicacion, params[:adopcion][:ubicacion]) && @adopcion.update_column(:raza, params[:adopcion][:raza])
      redirect_to adopcions_path, notice: "La edad del perro de la publicacion de adopcion fue modificado exitosamente"
    else
      redirect_to edit_adopcion_path(@adopcion), notice: @adopcion.errors[:base]
    end
  end

  # DELETE /adopcions/1 or /adopcions/1.json
  def destroy
    @adopcion.destroy

    respond_to do |format|
      format.html { redirect_to adopcions_url, notice: "Adopcion was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adopcion
      @adopcion = Adopcion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def adopcion_params
      params.require(:adopcion).permit(:nombre, :tamanio, :edad, :ubicacion, :raza, :user_id, :estado) # Agregamos :estado aquí
    end
end
