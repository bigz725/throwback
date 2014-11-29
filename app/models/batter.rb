class Batter < ActiveRecord::Base
  self.primary_key = 'batter_id'
  attr_accessible :batter_id, :first_name, :last_name
end
