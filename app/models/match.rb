class Match < ActiveRecord::Base
  attr_accessible :video, :name

  mount_uploader :video, MatchVideoUploader

  has_many :clips
end
