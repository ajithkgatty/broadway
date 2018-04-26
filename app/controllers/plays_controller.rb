class PlaysController < ApplicationController
  before_action :find_play, only: [:edit, :show, :destroy, :update]

  def index
  	@plays = Play.all.order("created_at DESC")
  end

  def new
  	@play = Play.new
  end

  def edit
  end

  def show
  end

  def update
  	if @play.update_attributes(play_params)
  		redirect_to play_path(@play)
  	else
  		redner 'edit'
  	end
  end

  def destroy
  	if @play.destroy
  		redirect_to root_path
  	else
  	end
  end

  def create
  	@play = Play.new(play_params)
  	if @play.save
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  private

  def play_params
  	params.require(:play).permit(:title, :description, :director)
  end

  def find_play
  	@play = Play.find(params[:id])
  end
end
