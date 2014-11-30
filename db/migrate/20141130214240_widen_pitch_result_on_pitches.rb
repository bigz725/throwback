class WidenPitchResultOnPitches < ActiveRecord::Migration
  def up
    connection.execute("ALTER TABLE pitches MODIFY pitch_result VARCHAR(20);")
    #connection.execute("ALTER TABLE pitches ADD CONSTRAINT fk_pitch_type FOREIGN KEY (pitch_result) REFERENCES pitch_types(code)")
  end

  def down
  end
end
