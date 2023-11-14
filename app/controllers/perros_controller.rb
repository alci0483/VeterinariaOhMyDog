class PerrosController < ApplicationController
  before_action :set_perro, only: %i[ show edit update destroy ]

  # GET /perros or /perros.json
  def index
    @perros = Perro.all
  end

  # GET /perros/1 or /perros/1.json
  def show
  end

  # GET /perros/new
  def new
    @perro = Perro.new
    @id_usuario = params[:usuario_id]
  end

  # GET /perros/1/edit
  def edit
  end

  # POST /perros or /perros.json
  def create
    @perro = Perro.new(perro_params)

    if @perro.save
      redirect_to usuario_path(@perro.user_id), notice: "Se agrego el perro exitosamente"
    else
      if @perro.errors[:base].include?("Ya tienes registrado este perro")
      flash.now[:alert] = "Ya tienes registrado este perro"
      end
      render :new, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /perros/1 or /perros/1.json
  def update
    respond_to do |format|
      if @perro.update(perro_params)
        format.html { redirect_to perro_url(@perro), notice: "Perro was successfully updated." }
        format.json { render :show, status: :ok, location: @perro }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @perro.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /perros/1 or /perros/1.json
  def destroy
    @perro.destroy

    respond_to do |format|
      format.html { redirect_to perros_url, notice: "Perro was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perro
      @perro = Perro.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def perro_params
      params.require(:perro).permit(:nombre, :edad, :raza, :sexo, :estado_salud, :user_id)
    end
end
