class Video < ActiveRecord::Base
  belongs_to :game
  belongs_to :channel
end
