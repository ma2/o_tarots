class Card < ActiveRecord::Base
  belongs_to :tarot
  validates_presence_of :name, :text
  acts_as_list scope: :tarot, column: :number, top_of_list: 0

  # ローマ数字でnumberを返す
  # 0～30まで対応
  def roman
    %w(0 I II III IV V VI VII VIII IX X XI XII XIII XIV XV XVI XVII XVIII XIX XX XXI XXII XXIII XXIV XXV XXVI XXVII XXVIII XXIX XXX)[number]
  end

end
