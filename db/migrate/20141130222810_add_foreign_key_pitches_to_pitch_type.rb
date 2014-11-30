class AddForeignKeyPitchesToPitchType < ActiveRecord::Migration
  def change
    connection.execute("ALTER TABLE pitches ADD CONSTRAINT fk_pitch_type FOREIGN KEY (pitch_result) REFERENCES pitch_types(code)")
  end
end
