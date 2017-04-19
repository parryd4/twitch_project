class Channel < ActiveRecord::Base
  has_many :videos
  has_one :stream
end
