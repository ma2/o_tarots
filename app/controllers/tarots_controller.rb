class TarotsController < ApplicationController
  before_action :set_tarot, only: [:show, :edit, :update, :destroy, :play]

  # GET /tarots
  # GET /tarots.json
  def index
    @tarots = Tarot.all
  end

  # GET /tarots/1
  # GET /tarots/1.json
  def show
  end

  # GET /tarots/new
  def new
    @tarot = Tarot.new
  end

  # GET /tarots/1/edit
  def edit
  end

  # POST /tarots
  # POST /tarots.json
  def create
    @tarot = Tarot.new(tarot_params)

    respond_to do |format|
      if @tarot.save
        format.html { redirect_to tarots_path, notice: 'Tarot was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tarot }
      else
        format.html { render action: 'new' }
        format.json { render json: @tarot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarots/1
  # PATCH/PUT /tarots/1.json
  def update
    respond_to do |format|
      if @tarot.update(tarot_params)
        format.html { redirect_to @tarot, notice: 'Tarot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tarot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarots/1
  # DELETE /tarots/1.json
  def destroy
    @tarot.destroy
    respond_to do |format|
      format.html { redirect_to tarots_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tarot
      @tarot = Tarot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tarot_params
      params.require(:tarot).permit(:name, :author, :pw)
    end
end
