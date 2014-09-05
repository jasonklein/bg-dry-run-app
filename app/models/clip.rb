class Clip < ActiveRecord::Base
  attr_accessible :match_id, :video, :player_id, :transcoded
  belongs_to :match
  belongs_to :player
end