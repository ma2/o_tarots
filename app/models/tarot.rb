class Tarot < ActiveRecord::Base
  has_many :cards, dependent: :destroy
  validates_uniqueness_of :name
  validates_presence_of :name, :author
end
