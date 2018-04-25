class PlaysController < ApplicationController
  def index
  	@plays = Play.all
  end

  def new
  	@play = Play.new
  end

  def create
  	@play = Play.new(play_params)
  end

  private

  def play_params
  	params.requrie(:play).permit(:title, :description, :director)
  end
end
