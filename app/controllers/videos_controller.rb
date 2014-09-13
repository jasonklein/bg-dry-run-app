class VideosController < ApplicationController
  def new
    @match = Match.find params[:match_id]
    @video = Video.new
  end

  def create
    video_location = params[:video].delete(:location)
    video_file = video_location.tempfile
    video_path = video_file.path
    @video = Video.new params[:video]
    @video.location = video_path

    if video_path
      set_ffmpeg_binary
      @video.add_metadata_to_video video_path
    end

    if @video.save
      redirect_to @video.match, notice: "Video added!"
    else
      render :new
    end

  end

  def set_ffmpeg_binary
    StreamioHelper.set_ffmpeg_binary
  end

end
