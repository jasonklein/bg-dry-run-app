class VideosController < ApplicationController
  def new
    match_id = params[:match_id]
    @match = Match.find match_id
    @video = Video.new match_id: match_id, key: params[:key]
  end

  def create
    @video = Video.new params[:video]

    if @video.save
      set_ffmpeg_binary
      @video.add_metadata_to_video
      redirect_to @video.match, notice: "Video added!"
    else
      render :new
    end
  end

  def set_ffmpeg_binary
    StreamioHelper.set_ffmpeg_binary
  end

end
