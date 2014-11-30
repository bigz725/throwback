class Pitcher < ActiveRecord::Base
  self.primary_key = 'pitcher_id'
  has_many :pitches
  attr_accessible :pitcher_id, :throws, :first_name, :last_name
end
