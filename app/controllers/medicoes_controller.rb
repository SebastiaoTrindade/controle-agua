class MedicoesController < ApplicationController
  
  before_action :logged_in_user
  before_action :set_medicao, only: %i[ show edit update destroy ]
  
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

     # Depuração: Veja os valores recebidos no log do servidor
    Rails.logger.debug "PARAMS RECEBIDOS: #{params[:medicao].inspect}"
  
    # Converte os valores de string para número (float)
    @medicao.manha = params[:medicao][:manha].to_f if params[:medicao][:manha].present?
    @medicao.tarde = params[:medicao][:tarde].to_f if params[:medicao][:tarde].present?
  
    # Calcula o consumo total
    if @medicao.manha && @medicao.tarde
      @medicao.consumo_total = @medicao.tarde - @medicao.manha
    end
  
    if @medicao.save  
      render json: { sucesso: true, message: "Medição salva com sucesso!", consumo_total: @medicao.consumo_total || 0 }, status: :ok
    else
      render json: { sucesso: false, error: @medicao.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end
  
  

  # PATCH/PUT /medicoes/1 or /medicoes/1.json
  def update
    if @medicao.update(medicao_params)
      render json: { sucesso: true, message: "Medicao atualizada com sucesso!", consumo_total: @medicao.consumo_total || 0 }
    else
      render json: { sucesso: false, error: "Erro ao atualizar medição." }, status: :unprocessable_entity
    end
  end

  # DELETE /medicoes/1 or /medicoes/1.json
  def destroy
    @medicao.destroy

    redirect_to medicoes_path, status: :see_other, notice: "Medição excluída com sucesso!"
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_medicao
      @medicao = Medicao.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to medicoes_path, alert: "Medição não encontrada!"
    end

    # Only allow a list of trusted parameters through.
    def medicao_params
      params.require(:medicao).permit(:user_id, :data, :manha, :tarde, :consumo_total)
    end
end
