class Card < ActiveRecord::Base
  belongs_to :tarot
  validates_presence_of :name, :text
  acts_as_list scope: :tarot, column: :number, top_of_list: 0
end
