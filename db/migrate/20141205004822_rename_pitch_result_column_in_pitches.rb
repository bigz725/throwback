class RenamePitchResultColumnInPitches < ActiveRecord::Migration
  def up
     connection.execute(<<-SQL)
       alter table `pitches`
        change `pitch_result` `pitch_result_code` varchar(20);
      SQL
  end

  def down
  end
end
