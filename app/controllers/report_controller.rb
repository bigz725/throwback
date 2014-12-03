class ReportController < ApplicationController
  
  def pitcher_performance
    @pitcher = Pitcher.where(:pitcher_id => params[:pitcher_id]).first
    @pitcher_game_ids = @pitcher.pitches.group(:game_id).count.keys
    @pitcher_pitches_per_game = @pitcher.pitches.group(:game_id).count.values
    @pitches = Pitch.where(:pitcher_id => params[:pitcher_id])
    @title = "#{@title} - Career report for #{@pitcher.first_name} #{@pitcher.last_name}"
  end
end
