class MatchesController < ApplicationController

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def destroy
  end
end
