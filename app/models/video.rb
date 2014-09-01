class Video < ActiveRecord::Base
  belongs_to :match
  has_many :clips
  attr_accessible :audio_channels, :audio_sample_rate, :audio_stream, :bitrate, :container, :creation_time, :duration, :height, :location, :video_codec, :video_stream, :width, :camera_name, :sender_id

  mount_uploader :location, MatchVideoUploader
end
