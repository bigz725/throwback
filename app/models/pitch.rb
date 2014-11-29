class Pitch < ActiveRecord::Base
  belongs_to :pitcher
  belongs_to :game
  belongs_to :batter
  attr_accessible :game_id, :pitcher_id, :inning, :top_of_inning, 
    :game_atbat_number, :pitch_per_atbat, :pitch_per_game, :batter_id, 
    :batter_stance, :strike_zone_top, :strike_zone_bottom, :pitch_result, 
    :event_description, :pitch_type, :pitch_initial_speed, :pitch_speed_at_homeplate, 
    :pitch_deflection_break_x, :pitch_deflection_break_z, :pitch_plate_location_x, 
    :pitch_plate_location_z, :pitch_initial_position_x, :pitch_initial_position_z, 
    :command_pitch_location_x, :command_pitch_location_z, :command_mitt_location_x, 
    :command_mitt_location_z
  
  
end
