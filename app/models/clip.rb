class Clip < ActiveRecord::Base
  attr_accessible :match_id, :url, :player_id, :transcoded, :base_module_id, :tag_time, :video_id
  
  belongs_to :match
  belongs_to :player
  belongs_to :base_module
  belongs_to :video

  default_scope where(transcoded: true)

  def self.unavailable
    unscoped.where(transcoded: false)
  end
end