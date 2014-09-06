class MatchesController < ApplicationController

  def index
    @matches = Match.all
  end

  def new
    @match = Match.new

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

end
