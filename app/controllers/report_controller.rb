class ReportController < ApplicationController
  
  def pitcher_performance
    @pitches = Pitch.where(:pitcher_id => params[:id])
  end
end
