class ReportController < ApplicationController
  
  def pitcher_performance
    @pitches = Pitch.where(:pitcher_id => params[:id])
    @pitches_per_game = @pitches.group(:game_id).count.to_a
    @pitches_per_game.insert(0, ["Game", "Pitches"])
  end
end
