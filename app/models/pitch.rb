class Pitch < ActiveRecord::Base
  belongs_to :pitcher
  belongs_to :game
  belongs_to :batter
  
end
