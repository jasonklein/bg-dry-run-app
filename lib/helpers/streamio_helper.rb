class StreamioHelper
  def set_ffmpeg_binary
    case Rails.env
    when "development"
      FFMPEG.ffmpeg_binary = File.expand_path("..") + "/ffmpeg"
    when "production"
      FFMPEG.ffmpeg_binary = File.expand_path(".") + "/vendor/ffmpeg"
    end
  end
end

set_ffmpeg_binary