class CheckinsController < ApplicationController
  before_action :set_crianca, only: %i[ show edit update destroy ]

  def index
    @criancas = current_usuario.checkins.all
    @crianca = Checkin.new
  end

  # POST /criancas or /criancas.json
  def create
    @crianca = Checkin.new(crianca_params.merge(uid: current_usuario.uid))

    respond_to do |format|
      if @crianca.save
        format.html { redirect_to checkins_url, notice: "Crianca was successfully created." }
        format.json { render :index, status: :created, location: @checkin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @checkin.errors, status: :unprocessable_entity }
      end
    end
  end

  def checked
    @checkin = Checkin.find(params[:id])
    if @checkin.update(checked: params[:checked], codigo: current_usuario.codigo)
      render json: { message: "Sucesso!"}
    else
      render json: { message: "Erro!"}
    end
  end

  def confirma    
  end

  # PATCH/PUT /criancas/1 or /criancas/1.json
  def update
    respond_to do |format|
      if @crianca.update(crianca_params)
        format.html { redirect_to checkins_url, notice: "Crianca was successfully updated." }
        format.json { render :index, status: :ok, location: @crianca }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @crianca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criancas/1 or /criancas/1.json
  def destroy
    @crianca.destroy

    respond_to do |format|
      format.html { redirect_to checkins_url, notice: "Crianca was successfully destroyed." }
      format.json { head :no_content }
    end
  end  

  private

    def set_crianca
        @crianca = current_usuario.checkins.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def crianca_params
      params.require(:checkin).permit(:nome, :nascimento, :observacoes, :uid, :codigo, :checked)
    end  

end
