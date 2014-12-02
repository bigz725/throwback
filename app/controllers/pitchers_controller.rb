class PitchersController < ApplicationController
  def index
    @pitchers = Pitcher.order("pitcher_id").paginate(:page => params[:page])
  end
  
  def show
    @pitcher = Pitcher.find(params[:id])
  end
end
