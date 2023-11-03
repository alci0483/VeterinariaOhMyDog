class AdopcionsController < ApplicationController
  before_action :set_adopcion, only: %i[ show edit update destroy ]

  # GET /adopcions or /adopcions.json
  def index
    @adopcions = Adopcion.all
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
  end

  # POST /adopcions or /adopcions.json
  def create
    @adopcion = Adopcion.new(adopcion_params)

    respond_to do |format|
      if @adopcion.save
        format.html { redirect_to adopcion_url(@adopcion), notice: "Adopcion was successfully created." }
        format.json { render :show, status: :created, location: @adopcion }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @adopcion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /adopcions/1 or /adopcions/1.json
  def update
    respond_to do |format|
      if @adopcion.update(adopcion_params)
        format.html { redirect_to adopcion_url(@adopcion), notice: "Adopcion was successfully updated." }
        format.json { render :show, status: :ok, location: @adopcion }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @adopcion.errors, status: :unprocessable_entity }
      end
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
      params.require(:adopcion).permit(:nombre, :tamanio, :edad, :ubicacion, :raza)
    end
end
