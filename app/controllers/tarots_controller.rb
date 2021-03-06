class TarotsController < ApplicationController
  include TarotOwner
  before_action :set_tarot, only: [:show, :edit, :update, :destroy]
  before_action :check_pw, only: [:edit, :destroy]

  def about
  end

  # GET /tarots/play_random
  # GET /tarots/play_random.json
  def play_random
    @play_mode = true
    session[:cards] = Card.all.map(&:id).shuffle
    @tname = '偶然タロット'
    @tauthor = 'すべてのタロット使い'
    @draw_path = draw_random_one_tarots_path
    @shuffle_path = play_random_tarots_path
    render '/cards/play'
  end

  # GET /tarots/:tarot_id/cards/draw_one
  # GET /tarots/:tarot_id/cards/draw_one.json
  def draw_random_one
    # session[:cards]はランダム化したカードidの配列
    # すでに全カード使いきっていたら再設定
    session[:cards] = Card.all.map(&:id).shuffle.shuffle if session[:cards].empty?
    @card = Card.find(session[:cards].pop)
    respond_to do |format|
      format.json { render action: 'show', status: :created }
      format.js
    end
  end

  # GET /tarots
  # GET /tarots.json
  def index
    @tarots = Tarot.all.order(:created_at)
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
    @tarot.key = generate_new_key

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
    if @tarot.key.blank?
      @tarot.key = generate_new_key
    end
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

  def check_pw
    redirect_to login_tarot_cards_path(@tarot, from:1) unless your_tarot? @tarot
  end

  # ランダムな英数字8文字
  # すでにあるものは回避する
  def generate_new_key
    r = SecureRandom.base64(6)
    keys = Tarot.pluck(:key)
    while keys.include? r do
      r = SecureRandom.base64(6)
    end
    r
  end
end
