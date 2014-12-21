class Pitcher < ActiveRecord::Base
  self.primary_key = 'pitcher_id'
  has_many :pitches
  
  attr_accessible :pitcher_id, :throws, :first_name, :last_name
  
  # #distinct and #uniq seem to be broken in this version of rails
  #see https://github.com/rails/rails/issues/7399
  #so work around with raw sql
  #in a prod environment I'd try upgrading Rails to 4, not sure I have time at the moment
  def distinct_games
    Game.find_by_sql(["select distinct game_id from pitches where pitcher_id = ? order by game_id asc", pitcher_id]).map(&:game_id)
  end
end
