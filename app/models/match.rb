class Match < ActiveRecord::Base
  attr_accessible :video, :name

  mount_uploader :video, MatchVideoUploader
end
