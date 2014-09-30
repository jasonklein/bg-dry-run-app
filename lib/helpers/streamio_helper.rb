class StreamioHelper

  def self.set_ffmpeg_binary
    case Rails.env
    when "development"
      FFMPEG.ffmpeg_binary = File.expand_path("..") + "/ffmpeg"
    when "production"
      FFMPEG.ffmpeg_binary = "ffmpeg"
    end
  end
end