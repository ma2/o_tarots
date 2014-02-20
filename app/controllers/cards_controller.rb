require 'csv'
class CardsController < ApplicationController
  before_action :set_tarot
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :check_pw, only: [:edit, :destroy]

  # GET /tarots/:tarot_id/cards/play
  # GET /tarots/:tarot_id/cards/play.json
  def play
    @play_mode = true
    session[:cards] = @tarot.cards.map(&:id).shuffle
    @tname = @tarot.name
    @tauthor = @tarot.author
    @draw_path = draw_one_tarot_cards_path(@tarot)
    @shuffle_path = play_tarot_cards_path(@tarot)
  end

  # GET /tarots/:tarot_id/cards/draw_one
  # GET /tarots/:tarot_id/cards/draw_one.json
  def draw_one
    # session[:cards]はランダム化したカードidの配列
    # すでに全カード使いきっていたら再設定
    session[:cards] = @tarot.cards.map(&:id).shuffle if session[:cards].empty?
    @card = Card.find(session[:cards].pop)
    @panel = %w(panel-default panel-primary panel-success panel-info panel-warning panel-danger).shuffle.shuffle[0]
    respond_to do |format|
      format.json { render action: 'show', status: :created }
      format.js
    end
  end

  # GET /tarots/:tarot_id/cards/upload
  def upload
  end

  # POST /tarots/:tarot_id/cards/create_from_csv
  # POST /tarots/:tarot_id/cards/create_from_csv.json
  def create_from_csv
    CSV.parse(csv_params[:csv]) do |row|
      @tarot.cards << Card.new(name:row[0], text:row[1], description:row[2])
    end

    respond_to do |format|
      if @tarot.save
        format.html { redirect_to tarot_cards_path(@tarot), notice: 'Card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @card }
      else
        format.html { render action: 'new' }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  def write_to_csv
    csv_string = CSV.generate do |csv|
      @tarot.cards.each do |c|
        csv << [c.name, c.text, c.description].map{|e|e ? e.encode('Shift_JIS') : ''}
      end
    end
    send_data csv_string, filename:"#{@tarot.name}.csv", type:'text/csv'
  end

  # GET /tarots/:tarot_id/cards
  # GET /tarots/:tarot_id/cards.json
  def index
    @cards = @tarot.cards.order(number: :asc)
  end

  # GET /tarots/:tarot_id/cards/:id
  # GET /tarots/:tarot_id/cards/:id.json
  def show
  end

  # GET /tarots/:tarot_id/cards/new
  def new
    @card = Card.new
  end

  # GET /tarots/:tarot_id/cards/:id/edit
  def edit
  end

  # POST /tarots/:tarot_id/cards
  # POST /tarots/:tarot_id/cards.json
  def create
    @tarot.cards << Card.new(card_params)

    respond_to do |format|
      if @tarot.save
        format.html { redirect_to tarot_cards_path(@tarot), notice: 'Card was successfully created.' }
        format.json { render action: 'show', status: :created, location: @card }
      else
        format.html { render action: 'new' }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tarots/:tarot_id/cards/:id
  # PATCH/PUT /tarots/:tarot_id/cards/:id.json
  def update
    respond_to do |format|
      if @card.update(card_params)
        format.html { redirect_to tarot_cards_path(@tarot), notice: 'Card was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tarots/:tarot_id/cards/:id
  # DELETE /tarots/:tarot_id/cards/:id.json
  def destroy
    @card.destroy
    respond_to do |format|
      format.html { redirect_to tarot_cards_path(@tarot) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_card
      @card = Card.find(params[:id])
    end

    def set_tarot
      @tarot = Tarot.find(params[:tarot_id])
    end

  # Never trust parameters from the scary internet, only allow the white list through.
    def card_params
      params.require(:card).permit(:number, :name, :text, :description)
    end

  def csv_params
    params.require(:cards).permit(:csv)
  end

  def check_pw
    false
  end
end
