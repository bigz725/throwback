class ReportController < ApplicationController
  
  def pitcher_performance
    @pitcher = Pitcher.where(:pitcher_id => params[:id]).first
    @pitcher_game_ids = @pitcher.pitches.group(:game_id).count.keys
    @pitcher_pitches_per_game = @pitcher.pitches.group(:game_id).count.values
    @pitches = Pitch.where(:pitcher_id => params[:id])
    @pitches_per_game = @pitches.group(:game_id).count.to_a
    @pitches_per_game.insert(0, ["Game", "Pitches"])
  end
end
