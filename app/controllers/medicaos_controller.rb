class MedicaosController < ApplicationController
  layout false
  before_action :set_medicao, only: %i[ show edit update destroy ]

  # GET /medicaos or /medicaos.json
  def index
    @medicaos = Medicao.all
  end

  # GET /medicaos/1 or /medicaos/1.json
  def show
  end

  # GET /medicaos/new
  def new
    @medicao = Medicao.new
  end

  # GET /medicaos/1/edit
  def edit
  end

  # POST /medicaos or /medicaos.json
  def create
    @medicao = Medicao.new(medicao_params)

    respond_to do |format|
      if @medicao.save
        format.html { redirect_to @medicao, notice: "Medicao was successfully created." }
        format.json { render :show, status: :created, location: @medicao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @medicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /medicaos/1 or /medicaos/1.json
  def update
    respond_to do |format|
      if @medicao.update(medicao_params)
        format.html { redirect_to @medicao, notice: "Medicao was successfully updated." }
        format.json { render :show, status: :ok, location: @medicao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @medicao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /medicaos/1 or /medicaos/1.json
  def destroy
    @medicao.destroy

    respond_to do |format|
      format.html { redirect_to medicaos_path, status: :see_other, notice: "Medicao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicao
      @medicao = Medicao.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def medicao_params
      params.require(:medicao).permit(:user_id, :data, :manha, :tarde, :consumo_total)
    end
end
