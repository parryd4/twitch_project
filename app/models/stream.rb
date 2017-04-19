class Stream < ActiveRecord::Base
  belongs_to :game
  belongs_to :channel
end
