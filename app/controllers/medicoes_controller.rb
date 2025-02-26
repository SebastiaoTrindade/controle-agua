class MedicoesController < ApplicationController
  
  before_action :logged_in_user
  
  # GET /medicoes or /medicoes.json
  def index
    @medicoes = Medicao.where(user_id: current_user.id).order(data: :desc)
  end

  # GET /medicoes/1 or /medicoes/1.json
  def show
  end

  # GET /medicoes/new
  def new
    @medicao = Medicao.new
  end

  # GET /medicoes/1/edit
  def edit
  end

  # POST /medicoes or /medicoes.json
  def create
    @medicao = Medicao.find_or_initialize_by(user_id: current_user.id, data: Date.today)

    if params[:medicao][:manha]
      @medicao.manha = params[:medicao][:manha]
    end

    if params[:medicao][:tarde]
      @medicao.tarde = params[:medicao][:tarde]
    end

    if @medicao.manha.present? && @medicao.tarde.present?
      @medicao.consumo_total = @medicao.tarde - @medicao.manha 
    end

    if @medicao.save  
      render json: { message: "Medicão salva com sucesso!", consumo_total: @medicao.consumo_total }
    else
      render json: { error: "Erro ao salvar medição."}, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /medicoes/1 or /medicoes/1.json
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

  # DELETE /medicoes/1 or /medicoes/1.json
  def destroy
    @medicao.destroy

    respond_to do |format|
      format.html { redirect_to medicoes_path, status: :see_other, notice: "Medicao was successfully destroyed." }
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
