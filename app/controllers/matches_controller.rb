class MatchesController < ApplicationController

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
    @match.videos.build
  end

  def create
    @match = Match.new params[:match]

    set_ffmpeg_binary
    path_to_video = set_ffmpeg_path_to_video(@match)
    ffmpeg_data = get_ffmpeg_data(path_to_video)
    add_metadata_to_video(@match.videos.first, ffmpeg_data)
    
    if @match.save
      redirect_to matches_path, notice: "Match #{@match.name} saved."
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  def set_ffmpeg_binary
    StreamioHelper.set_ffmpeg_binary
  end

  def set_ffmpeg_path_to_video(match)
    match.videos.first.location.file.path
  end

  def get_ffmpeg_data(path_to_video)
    FFMPEG::Movie.new path_to_video
  end

  def add_metadata_to_video(video, ffmpeg_data)
    video.audio_channels = ffmpeg_data.audio_channels
    video.audio_sample_rate = ffmpeg_data.audio_sample_rate
    video.audio_stream = ffmpeg_data.audio_stream
    video.bitrate = ffmpeg_data.bitrate
    video.container = ffmpeg_data.container
    video.creation_time = ffmpeg_data.creation_time
    video.duration = ffmpeg_data.duration
    video.width = ffmpeg_data.width if ffmpeg_data.width > 0
    video.height = ffmpeg_data.height if ffmpeg_data.height > 0
    video.video_codec = ffmpeg_data.video_codec
    video.video_stream = ffmpeg_data.video_stream
  end

end
