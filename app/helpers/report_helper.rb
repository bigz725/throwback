#  <td>Pitch Type</td>
#  <td>Avg. Velocity</td>
#  <td>Max Velocity</td>
#  <td>Horizontal break</td>
#  <td>Count</td>
#  <td>Strikes (pct)</td>
#  <td>Swings (pct)</td>
#  <td>Whiffs (pct)</td>
#  <td>In play, no out</td>
module ReportHelper
  def pitch_rollup(pitches)
    
    group_by_type = pitches.group(:pitch_type)
    avg_velocity_hash = {:name => :average_velocity, :data => group_by_type.average(:pitch_initial_speed)}
    max_velocity_hash = {:name => :max_velocity, :data => group_by_type.maximum(:pitch_initial_speed)}
    horizontal_break_hash = {:name => :horiz_break, :data => group_by_type.average(:pitch_deflection_break_x)}
    count_hash = {:name => :pitch_type_count, :data => group_by_type.count}
    strike_count_hash = {:name => :strike_count, :data => group_by_type.joins(:pitch_result).where(
      :pitch_results => {:strike => true}).count}
    swing_count_hash = {:name => :swing_count, :data => group_by_type.joins(:pitch_result).where(
      :pitch_results => {:swinging => true}).count}
    whiff_count_hash = {:name => :whiff_count, :data => group_by_type.joins(:pitch_result).where(
      :pitch_results => {:contact => false, :swinging => true}).count}
    in_play_no_out_hash = {:name => :ipno, :data => group_by_type.joins(:pitch_result).where(
      :pitch_results => {:in_play => true, :out => false }).count}

    all_hashes = [avg_velocity_hash, max_velocity_hash, horizontal_break_hash, count_hash, 
        strike_count_hash, swing_count_hash, whiff_count_hash, in_play_no_out_hash]
    
    retval = []
    group_by_type.count.keys.each do |type|
      rollup = {}
      rollup[:type] = type

      all_hashes.each do |hash|
        rollup_key = hash[:name]
        if (hash[:data][type] != nil)
          rollup[rollup_key] = hash[:data][type]#.to_s
        else
          rollup[rollup_key] = 'N/A'
        end
      end
      retval << rollup        
    end

    retval
  end
end
