class CreatePitches < ActiveRecord::Migration
  def up
    create_table :pitches do |t|
      t.string :game_id
      t.string :pitcher_id
      
      t.integer :inning
      t.boolean :top_of_inning
      t.integer :game_atbat_number
      t.integer :pitch_per_atbat
      t.integer :pitch_per_game
      t.string :batter_id
      t.string :batter_stance, :limit => 1 
      t.float :strike_zone_top
      t.float :strike_zone_bottom
      t.string :pitch_result, :limit => 1
      t.text :event_description
      t.string :pitch_type, :limit => 2
      t.float :pitch_initial_speed, :pitch_speed_at_homeplate, :pitch_deflection_break_x, 
        :pitch_deflection_break_z, :pitch_plate_location_x, :pitch_plate_location_z, 
        :pitch_initial_position_x, :pitch_initial_position_z, 
        :command_pitch_location_x, :command_pitch_location_z, :command_mitt_location_x,
        :command_mitt_location_z

      t.timestamps
    end
    reference('game_id', 'games', 'game_id')
    reference('pitcher_id', 'pitchers', 'pitcher_id')
    reference('batter_id', 'batters', 'batter_id')
    execute('alter table pitches add index pitch_type_idx(pitch_type);')
  end
  
  def down
    delete_table :pitches
  end
  
  def reference(column_name, table_name, target_column_id)
    execute("alter table pitches add constraint fk_#{column_name} 
        foreign key (#{column_name}) references #{table_name}(#{target_column_id});")
  end
end

#game_date	pitcher_id	inning	top_of_inning	game_atbat_number	pitch_per_atbat	
#pitch_per_game	pitcher_throws	batter_id	batter_stance	strike_zone_top	
#strike_zone_bottom	pitch_result	event_code	event_description	pitch_type	
#pitch_initial_speed	pitch_speed_at_homeplate	pitch_deflection_break_x	
#pitch_deflection_break_z	pitch_plate_location_x	pitch_plate_location_z	
#pitch_initial_position_x	pitch_initial_position_z	command_pitch_location_x	
#command_pitch_location_z	command_mitt_location_x	command_mitt_location_z
