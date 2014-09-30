class VideosController < ApplicationController
  def new
    @match = Match.find params[:match_id]
    @video = Video.new
  end

  def create
    @video = Video.new params[:video]

    # if @video.location.file
    #   set_ffmpeg_binary
    #   @video.add_metadata_to_video
    # end

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
