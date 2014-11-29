class Game < ActiveRecord::Base
  self.primary_key = 'game_id'
  attr_accessible :game_id, :game_date
  # attr_accessible :title, :body
end
