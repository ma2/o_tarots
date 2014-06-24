class WorldController < ApplicationController
  before_action :set_tarot

  def shuffle
  end

  def draw
  end

  private
  def set_tarot
    @tarot = Tarot.find params[:id]
  end
end
