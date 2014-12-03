class ReportController < ApplicationController
  
  def pitcher_performance
    @pitcher = Pitcher.where(:pitcher_id => params[:pitcher_id]).first
    @pitcher_game_ids = @pitcher.pitches.group(:game_id).count.keys
    @pitcher_pitches_per_game = @pitcher.pitches.group(:game_id).count.values
    @pitches = Pitch.where(:pitcher_id => params[:pitcher_id])
    @title = "#{@title} - Career report for #{@pitcher.first_name} #{@pitcher.last_name}"
  end
  
  def pitcher_performance_game
    @pitcher = Pitcher.where(:pitcher_id => params[:pitcher_id]).first
    @game = Game.where(:game_id => params[:game_id]).first
    @pitches = Pitch.where(:pitcher_id => params[:pitcher_id],:game_id => params[:game_id] )
    
    
    @title = "#{@title} - Game #{@game.game_id} report for #{@pitcher.first_name} #{@pitcher.last_name}"

  end
end
