class CampanasController < ApplicationController
  before_action :set_campana, only: %i[ show edit update destroy ]

  # GET /campanas or /campanas.json
  def index
    @campanas = Campana.all
  end

  # GET /campanas/1 or /campanas/1.json
  def show
  end

  # GET /campanas/new
  def new
    @campana = Campana.new
  end

  # GET /campanas/1/edit
  def edit
  end

  # POST /campanas or /campanas.json
  def create
    @campana = Campana.new(campana_params)

    if @campana.save
      redirect_to campanas_path, notice: "La Nueva publicacion de Campaña fue Exitosa"
    else
      @error_message = "Ya Existe esta Publicacion de Campaña"
      render :new, status: :unprocessable_entity
    end
end

  # PATCH/PUT /campanas/1 or /campanas/1.json
  def update
    respond_to do |format|
      if @campana.update(campana_params)
        format.html { redirect_to campana_url(@campana), notice: "Campana was successfully updated." }
        format.json { render :show, status: :ok, location: @campana }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campana.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campanas/1 or /campanas/1.json
  def destroy
    @campana.destroy

    respond_to do |format|
      format.html { redirect_to campanas_url, notice: "Campana was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campana
      @campana = Campana.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campana_params
      params.require(:campana).permit(:nombre_campana, :objetivo, :monto, :dni_titular_responsable)
    end
end
