class BaseModulesController < ApplicationController
  def new
    @match = Match.find params[:match_id]
    @base_module = BaseModule.new
  end

  def create
    @base_module = BaseModule.new params[:base_module]

    if @base_module.save
      redirect_to @base_module.match, notice: "Report added!"
    else
      render :new
    end
  end

  def show
    @base_module = BaseModule.find params[:id]
  end
end
