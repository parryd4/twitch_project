class Game < ActiveRecord::Base
  has_many :streams
  has_many :videos

end
