class Clip < ActiveRecord::Base
  attr_accessible :match_id, :video, :player_id
  belongs_to :match
  belongs_to :player
end
