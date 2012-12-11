class PlayersController < ApplicationController
  def move
    @player = Player.find params[:id]
    @player.move 
  end
end
