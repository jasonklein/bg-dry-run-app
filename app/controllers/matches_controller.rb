class MatchesController < ApplicationController

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(params[:match])
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
end
