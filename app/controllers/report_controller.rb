class ReportController < ApplicationController
  include ReportHelper
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
    @pitches = Pitch.where(:pitcher_id => params[:pitcher_id],:game_id => params[:game_id] ).order(:pitch_per_game)
    @pitch_rollup = pitch_rollup(@pitches)
    
    @title = "#{@title} - Game #{@game.game_id} report for #{@pitcher.first_name} #{@pitcher.last_name}"

  end
  
  def velocity_data
    pitches = Pitch.where(:pitcher_id => params[:pitcher_id],
      :game_id => params[:game_id] ).order(:pitch_per_game).map{|x| [x.pitch_type,x.pitch_initial_speed,x.pitch_per_game ]}
    pitcher = Pitcher.find params[:pitcher_id]
    game = Game.find params[:game_id]
    response = {:pitches => pitches, :pitcher => pitcher, :game => game}
    respond_to do |format|
      format.js {  render :json => response}
      format.json {render :json => response}
    end
  end
  
  def pitches_per_game
    pitcher = Pitcher.where(:pitcher_id => params[:pitcher_id]).first
    pitches = pitcher.pitches.group(:game_id).count
    game_array = []
    pitches.each_pair do |k, v|
      game_array << {name: k, y: v, url: pitcher_game_report_url(pitcher.pitcher_id, k) }
    end
    response = {games: game_array, pitcher: pitcher}
    respond_to do |format|
      format.js {  render :json => response}
      format.json {render :json => response}
    end
  end
end
