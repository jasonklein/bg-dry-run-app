class Clip < ActiveRecord::Base
  attr_accessible :match_id, :video
  belongs_to :match
end
