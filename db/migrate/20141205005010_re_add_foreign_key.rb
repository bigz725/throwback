class ReAddForeignKey < ActiveRecord::Migration
  def up
    connection.execute(<<-SQL)  
       alter table pitches
        add constraint fk_pitch_type foreign key (pitch_result_code) references pitch_results(code);
        
    SQL
  end

  def down
  end
end
