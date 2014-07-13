class WorldController < ApplicationController
  before_action :set_tarot
  layout 'world'

  # GET /world/1
  # GET /world/1.json
  def show
    session[:cards] = @tarot.cards.pluck(:id).shuffle
    respond_to do |format|
      format.html
      format.json { head :no_content }
    end
  end

  # GET /world/1/draw
  # GET /world/1/draw.json
  def draw
    @card = Card.find(session[:cards].pop)
  end

  private
  def set_tarot
    @tarot = Tarot.find_by(key: params[:id])
  end
end
