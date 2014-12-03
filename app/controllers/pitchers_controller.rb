class PitchersController < ApplicationController
  def index
    if (params["search"])
      search_term = params["search"] + '%'
      @pitchers = Pitcher.where('pitcher_id like ? or first_name like ? or last_name like ?',
        search_term, search_term, search_term).order("pitcher_id").paginate(:page => params[:page])
    else
      @pitchers = Pitcher.order("pitcher_id").paginate(:page => params[:page])
    end
  end
  
  def show
    @pitcher = Pitcher.find(params[:id])
  end
end
