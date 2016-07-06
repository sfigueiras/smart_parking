class Spot < ActiveRecord::Base
  belongs_to :area

  has_many :reservations
  has_many :users, through: :reservations
end