class Clip < ActiveRecord::Base
  attr_accessible :match_id, :video, :player_id, :transcoded, :base_module_id, :tag_time
  
  belongs_to :match
  belongs_to :player
  belongs_to :base_module
end