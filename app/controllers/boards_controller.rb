class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new params[:board]
    @board.prepare_fields
    if @board.save 
      current_player.join_game(@board)
      redirect_to @board
    else
      redirect_to :index 
    end
  end

  def show
    @board = Board.find params[:id]
  end

  def join
    @board = Board.find params[:id]
    current_player.join_game(@board)
    redirect_to @board
  end
end
