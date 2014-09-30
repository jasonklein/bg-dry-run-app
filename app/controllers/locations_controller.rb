class LocationsController < ApplicationController
  def new
    @uploader = Video.new.location
    @uploader.success_action_redirect = new_match_video_url
  end
end