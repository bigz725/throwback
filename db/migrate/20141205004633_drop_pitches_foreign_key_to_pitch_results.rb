class DropPitchesForeignKeyToPitchResults < ActiveRecord::Migration
  def up
        connection.execute(<<-SQL)
      alter table `pitches`
        drop foreign key `fk_pitch_type`;
      SQL
  end
  
  def down
    
  end

end
