class Video < ActiveRecord::Base
  belongs_to :match
  has_many :clips
  attr_accessible :audio_channels, :audio_sample_rate, :audio_stream, :bitrate, :container, :creation_time, :duration, :height, :video_codec, :video_stream, :width, :camera, :match_id
  # attr_accessible :location

  # mount_uploader :location, MatchVideoUploader

  validates :match_id, presence: true
  # validates :location, presence: true

  def duration_in_minutes
    (self.duration / 60).round(2)
  end

  # def set_ffmpeg_path_to_video
  #   self.location.file.path
  # end

  # def get_ffmpeg_data(video_path)
  #   FFMPEG::Movie.new video_path
  # end

  def add_metadata_to_video(video_path)
    ffmpeg_data = StreamioHelper.get_ffmpeg_data video_path
    self.audio_channels = ffmpeg_data.audio_channels
    self.audio_sample_rate = ffmpeg_data.audio_sample_rate
    self.audio_stream = ffmpeg_data.audio_stream
    self.bitrate = ffmpeg_data.bitrate
    self.container = ffmpeg_data.container
    self.creation_time = ffmpeg_data.creation_time
    self.duration = ffmpeg_data.duration
    self.width = ffmpeg_data.width if ffmpeg_data.width > 0
    self.height = ffmpeg_data.height if ffmpeg_data.height > 0
    self.video_codec = ffmpeg_data.video_codec
    self.video_stream = ffmpeg_data.video_stream
  end

end
