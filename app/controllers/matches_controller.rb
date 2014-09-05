class MatchesController < ApplicationController

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
    @match.videos.build

    10.times { @match.players.build }

  end

  def create
    if players_attributes = params[:match][:players_attributes]
      players_attributes.delete_if do |key,value|
        players_attributes[key]["upi"].blank?
      end
      params[:match][:players_attributes] = players_attributes
    end

    @match = Match.new params[:match]

    if @match.videos.first.location.file
      set_ffmpeg_binary
      path_to_video = set_ffmpeg_path_to_video(@match)
      ffmpeg_data = get_ffmpeg_data(path_to_video)
      add_metadata_to_video(@match.videos.first, ffmpeg_data)
    end
    
    if @match.save
      redirect_to matches_path, notice: "Match #{@match.name} saved."
    else

      more_players_count = 10 - @match.players.count
      more_players_count.times { @match.players.build }
      render 'new'
    end
  end

  def show
    @match = Match.find params[:id]
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
