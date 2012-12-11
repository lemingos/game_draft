class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected 
  
  helper_method :current_player
  
  def current_player
    if session[:user_id] and Player.exists? session[:user_id]
      Player.find session[:user_id]
    else
      @player = Player.create color: ("%06x" % (rand * 0xffffff))
      session[:user_id] = @player.id
      @player
    end
  end
end
