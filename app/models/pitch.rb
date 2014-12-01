class Pitch < ActiveRecord::Base
  belongs_to :pitcher
  belongs_to :game
  belongs_to :batter
  belongs_to :pitch_result, :foreign_key => 'pitch_result'
  attr_accessible *column_names
  
  def self.strikes
    Pitch.joins(:pitch_result).where(:pitch_results => {:strike => true, :contact => false} )
  end
  
  def self.balls
    Pitch.joins(:pitch_result).where(:pitch_results => {:strike => false, :swinging => false})
  end
  
  def self.hits
    Pitch.joins(:pitch_result).where(:pitch_results => {:in_play => true, :out => false} )
  end
  
  def self.vs_left
    where(:batter_stance => 'L')
  end
  
  def self.vs_right
    where(:batter_stance => 'R')
  end
  
end
