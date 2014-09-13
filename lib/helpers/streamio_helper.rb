class StreamioHelper

  def self.set_ffmpeg_binary
    case Rails.env
    when "development"
      FFMPEG.ffmpeg_binary = File.expand_path("..") + "/ffmpeg"
    when "production"
      FFMPEG.ffmpeg_binary = File.expand_path(".") + "/vendor/ffmpeg"
    end
  end

  def self.get_ffmpeg_data(video_path)
    FFMPEG::Movie.new video_path
  end

end